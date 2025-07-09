#!/bin/bash
set -e  # Ferma lo script se un comando fallisce

echo "[+] Aggiornamento sistema..."
apt-get update

echo "[+] Installazione di Docker..."
apt-get install -y docker.io

echo "[+] Aggiunta dell'utente vagrant al gruppo docker..."
usermod -aG docker vagrant

echo "[+] Abilitazione e avvio del servizio Docker..."
systemctl enable docker
systemctl start docker

