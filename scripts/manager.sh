#!/bin/bash

curl -fsSL https://get.docker.com | sudo bash

docker swarm init --advertise-addr 192.168.56.10
worker_token=$(docker swarm join-token worker -q)

echo "$worker_token" > /vagrant/.vagrant/worker.token