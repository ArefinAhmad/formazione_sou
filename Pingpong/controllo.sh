#!/bin/bash

# Nodo A e nodo B
NODES=("node1" "node2")
CURRENT=0

while true; do
  ACTIVE_NODE=${NODES[$CURRENT]}
  INACTIVE_NODE=${NODES[$((1 - CURRENT))]}

  echo "[attivato] Lancio container su $ACTIVE_NODE"
  #versione precedente:vagrant ssh $ACTIVE_NODE -c "docker rm -f echo-server || true && docker run -d --name echo-server -p 8080:80 ealen/echo-server"
  vagrant ssh $ACTIVE_NODE -c "docker ps -a --format '{{.Names}}' | grep -q '^echo-server$' && docker rm -f echo-server && docker run -d --name echo-server -p 8080:80 ealen/echo-server"
  echo "[disattivato] Fermata container su $INACTIVE_NODE (se esiste)"
  #versione precedente:vagrant ssh $INACTIVE_NODE -c "docker rm -f echo-server || true" 
  vagrant ssh $INACTIVE_NODE -c "docker ps -a --format '{{.Names}}' | grep -q '^echo-server$' && docker rm -f echo-server"

# Attende 60 secondi prima di passare al nodo successivo
  sleep 60

  CURRENT=$((1 - CURRENT))  # switcha nodo
done
