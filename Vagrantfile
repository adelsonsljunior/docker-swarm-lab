# -*- mode: ruby -*-
# vi: set ft=ruby :

WORKERS = 2

Vagrant.configure('2') do |config|
  config.vm.define 'manager' do |vb|
    vb.vm.box = 'ubuntu/jammy64'
    vb.vm.hostname = 'manager'
    vb.vm.network 'private_network', ip: '192.168.56.10'

    vb.vm.provider 'virtualbox' do |v|
      v.memory = 2048
      v.cpus = 2
    end

    vb.vm.provision 'shell', path: 'scripts/manager.sh'
    vb.vm.provision 'shell', path: 'scripts/swarmpit.sh'

    # Script final que só será executado manualmente
    vb.vm.provision 'shell',
                    path: 'scripts/portainer.sh',
                    run: 'never',
                    name: 'final-config'
  end

  (1..WORKERS).each do |i|
    config.vm.define "worker#{i}" do |vb|
      vb.vm.box = 'ubuntu/jammy64'
      vb.vm.hostname = "worker#{i}"
      vb.vm.network 'private_network', ip: "192.168.56.2#{i}"

      vb.vm.provider 'virtualbox' do |v|
        v.memory = 1024
        v.cpus = 1
      end

      vb.vm.provision 'shell', path: 'scripts/worker.sh'
    end

    config.trigger.after :up do |trigger|
      trigger.only_on = "worker#{WORKERS}" # Só dispara no último worker
      trigger.run = { inline: "vagrant ssh manager -c 'bash /vagrant/scripts/portainer.sh'" }
    end
  end
end
