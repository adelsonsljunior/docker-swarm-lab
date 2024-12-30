# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/jammy64"
    master.vm.network "private_network", ip: "192.168.56.10"

    master.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    master.vm.provision "shell", path: "scripts/docker.sh"
    master.vm.provision "shell", path: "scripts/portainer.sh"

  end

end
