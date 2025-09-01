FROM python:3.11-slim

WORKDIR /app


RUN pip install --no-cache-dir flask opentelemetry-sdk \
    opentelemetry-exporter-otlp \
    opentelemetry-instrumentation-flask \
    prometheus-client 

CMD ["python3", "app.py"]
