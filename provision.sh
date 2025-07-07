#!/bin/bash

# Aggiorna pacchetti
apt-get update -y
apt-get upgrade -y

# Installa Apache
apt-get install apache2 -y

# Abilita Apache al boot
systemctl enable apache2

# Sostituisci la pagina index
echo "<h1>Benvenuto nel mio server Vagrant!</h1>" > /var/www/html/index.html

# Riavvia Apache per sicurezza
systemctl restart apache2

# Installa pacchetti necessari per Docker
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    -y

# Aggiunge la chiave GPG ufficiale di Docker
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Aggiunge il repository di Docker
echo \
  "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aggiorna pacchetti di nuovo e installa Docker Engine
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Abilita e avvia Docker
systemctl enable docker
systemctl start docker

# Aggiunge l'utente vagrant al gruppo docker (per usare docker senza sudo)
usermod -aG docker vagrant