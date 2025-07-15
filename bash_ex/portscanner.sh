#!/bin/bash

# Port Scanner semplificato con Netcat
# Uso: ./port_scanner.sh <host> <porta_inizio-porta_fine>

# Sanificazione argomenti
if [ $# -ne 2 ]; then
    echo "Utilizzo: $0 <host> <porta_inizio-porta_fine>"
    exit 1
fi

HOST=$1
PORT_RANGE=$2

# Verifica che il range abbia il formato corretto e salva le porte
if [[ $PORT_RANGE =~ ^([0-9]+)-([0-9]+)$ ]]; then
    PORT_START=${BASH_REMATCH[1]}
    PORT_END=${BASH_REMATCH[2]}
else
    echo "Errore: il range di porte deve essere nel formato porta_inizio-porta_fine (es. 20-80)"
    exit 1
fi

# Controllo validità numerica e che inizio < fine
if ! [[ $PORT_START -ge 1 && $PORT_END -le 65535 && $PORT_START -le $PORT_END ]]; then
    echo "Errore: intervallo di porte non valido. Valori ammessi: 1-65535"
    exit 1
fi

echo "Scansione porte TCP aperte su $HOST da $PORT_START a $PORT_END..."

for ((port=$PORT_START; port<=$PORT_END; port++)); do
    # Tentativo di connessione con timeout breve, senza usare -z
    timeout 1 bash -c "echo > /dev/tcp/$HOST/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Porta $port APERTA"
    fi
done

echo "Scansione completata."

