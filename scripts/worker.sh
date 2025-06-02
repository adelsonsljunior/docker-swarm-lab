#!/bin/bash

curl -fsSL https://get.docker.com | sudo bash

while [ ! -f /vagrant/.vagrant/worker.token ]; do
  echo "Aguardando token do master..."
  sleep 3
done

worker_token=$(cat /vagrant/.vagrant/worker.token)

docker swarm join --token "$worker_token" 192.168.56.10:2377