from flask import Flask, Response
from opentelemetry import trace, metrics
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.sdk.metrics import MeterProvider
from opentelemetry.sdk.metrics.export import PeriodicExportingMetricReader
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import OTLPSpanExporter
from opentelemetry.exporter.otlp.proto.grpc.metric_exporter import OTLPMetricExporter
from opentelemetry.instrumentation.flask import FlaskInstrumentor
from prometheus_client import Counter as PromCounter, generate_latest

# ----------------------
# Config OpenTelemetry
# ----------------------
resource = Resource(attributes={"service.name": "python-flask-app"})

# Tracing
trace.set_tracer_provider(TracerProvider(resource=resource))
tracer = trace.get_tracer(__name__)
otlp_trace_exporter = OTLPSpanExporter(endpoint="otel-collector:4317", insecure=True)
trace.get_tracer_provider().add_span_processor(BatchSpanProcessor(otlp_trace_exporter))

# Metrics (OTLP)
otlp_metric_exporter = OTLPMetricExporter(endpoint="otel-collector:4317", insecure=True)
reader = PeriodicExportingMetricReader(otlp_metric_exporter, export_interval_millis=1000)
metrics.set_meter_provider(MeterProvider(metric_readers=[reader]))
meter = metrics.get_meter(__name__)

REQUEST_COUNTER_OTLP = meter.create_counter(
    name="http_requests_total_otlp",
    description="Counter HTTP requests OTLP",
    unit="1",
)

# ----------------------
# Flask app
# ----------------------
app = Flask(__name__)
FlaskInstrumentor().instrument_app(app)

# ----------------------
# Metriche Prometheus
# ----------------------
REQUEST_COUNTER_PROM = PromCounter("http_requests_total", "Total HTTP requests", ["endpoint"])

@app.before_request
def before_request():
    # incrementa counter Prometheus
    REQUEST_COUNTER_PROM.labels(endpoint="/").inc()
    # incrementa counter OTLP
    REQUEST_COUNTER_OTLP.add(1)

@app.route("/metrics")
def metrics_endpoint():
    return Response(generate_latest(), mimetype="text/plain")

@app.route("/")
def hello():
    return "Hello Flask + OT"

# ----------------------
# Avvio app
# ----------------------
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
