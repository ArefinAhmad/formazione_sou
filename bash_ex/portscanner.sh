#!/bin/bash

#versione per node1 e node2 su vagrant
# Questo script esegue una scansione delle porte TCP aperte su un host specificato 

# Esempio: ./portscanner.sh 192.168.56.12 20-100 



# Controllo numero di argomenti
if [ $# -ne 2 ]; then
    echo "Errore :Utilizzo: $0 <host> <porta_inizio-porta_fine>"
    exit 1
fi

#inizializzo le variabili 
HOST="$1"
PORT_RANGE="$2"

#if di controllo affinchè il secondo parametro sia un intero ( lo metto con il trattino cosi port_s e port_e passano come un paramentro unico))
if [[ $PORT_RANGE =~ ^([0-9]+)-([0-9]+)$ ]]; then
    PORT_START=${BASH_REMATCH[1]}
    PORT_END=${BASH_REMATCH[2]}
else
    echo "Errore: il range di porte deve essere nel formato porta_inizio-porta_fine (es: 20-80)"
    exit 1
fi
# Controllo che la porta finale sia valida e non superiore a 65535 e quella iniziale sia maggiore o uguale a 1
if ! [[ $PORT_END -ge 1 && $PORT_END -le 65535 ]]; then
    echo "Errore: porta finale non valida (1-65535)"
    exit 1
fi
# Controllo che la porta iniziale sia minore o uguale alla porta finale
if [ $PORT_START -gt $PORT_END ]; then
    echo "Errore: porta iniziale maggiore della finale"
    exit 1
fi
#Eseguo la scansione
echo "Scansione porte TCP aperte su $HOST da $PORT_START a $PORT_END..."
#scorrimento delle porte con sequence :) 
# Utilizzo di netcat per verificare le porte aperte
for port in $(seq $PORT_START $PORT_END); do
    nc -w 1 "$HOST" "$port" < /dev/null > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Porta $port APERTA"
    fi
done

echo "Scansione completata."
