# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "master" do |vb|
    vb.vm.box = "ubuntu/jammy64"
    vb.vm.network "private_network", ip: "192.168.56.10"

    vb.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    vb.vm.provision "shell", path: "scripts/docker.sh"
    vb.vm.provision "shell", path: "scripts/portainer.sh"
  end

  config.vm.define "worker01" do |vb|
    vb.vm.box = "ubuntu/jammy64"
    vb.vm.network "private_network", ip: "192.168.56.11"

    vb.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    vb.vm.provision "shell", path: "scripts/docker.sh"
  end

  config.vm.define "worker02" do |vb|
    vb.vm.box = "ubuntu/jammy64"
    vb.vm.network "private_network", ip: "192.168.56.12"

    vb.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end

    vb.vm.provision "shell", path: "scripts/docker.sh"
  end

end
