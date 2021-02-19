# -*- mode: ruby -*-
# vi: set ft=ruby :

#setting Vagrant API Version
VAGRANTFILE_API_VERSION = "2"
#setting number of vm
N = 1
#adding oracle linux box
BOX_URL = "https://oracle.github.io/vagrant-projects/boxes"
BOX_NAME = "oraclelinux/7"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

(1..N).each do |machine_id|
  config.vm.define "db#{machine_id}" do |machine|
    machine.vm.hostname = "oradb19c.private"
    machine.vm.box= "oraclelinux/7"
    machine.vm.box_url = "#{BOX_URL}/#{BOX_NAME}.json"
    machine.vm.network "private_network", ip: "192.168.56.#{10+machine_id}"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 6144
    vb.cpus = 2 
  end

    if machine_id == N
      machine.vm.provision :ansible do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.inventory_path = "./hosts"
        ansible.limit = 'all'
      end
    end
  end
end
end

