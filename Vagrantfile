# -*- mode: ruby -*-
# vi: set ft=ruby :

UBUNTU_BIONIC64 = "ubuntu/bionic64"
UBUNTU_BIONIC64_URL = "https://app.vagrantup.com/ubuntu/boxes/bionic64"

LOAD_BALANCER_IP = "10.0.50.41"
WEBAPP_1_IP = "10.0.50.42"
WEBAPP_2_IP = "10.0.50.43"

Vagrant.configure("2") do |config|

  config.vm.box = UBUNTU_BIONIC64
  config.vm.box_url = UBUNTU_BIONIC64_URL

  #################### NGINX Server  #######################
  config.vm.define "loadbalancer" do |subconfig|
    subconfig.vm.box = UBUNTU_BIONIC64
    subconfig.vm.box_url = UBUNTU_BIONIC64_URL
    subconfig.vm.hostname = "loadbalancer.local"
    subconfig.vm.network :private_network, ip: LOAD_BALANCER_IP

    subconfig.vm.provider "virtualbox" do |virtualbox|
      # Customize the amount of memory on the VM:
      virtualbox.memory = "1024"
      virtualbox.cpus = "1"
      # Enable promiscuous mode
      virtualbox.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
    ## Now Provision Software Using Ansible
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/nginx-playbook.yml"
    end
  end

  #################### Java App Server 1 #######################
  config.vm.define "webapp01" do |subconfig|
    subconfig.vm.box = UBUNTU_BIONIC64
    subconfig.vm.box_url = UBUNTU_BIONIC64_URL
    subconfig.vm.hostname = "webapp01.local"
    subconfig.vm.network :private_network, ip: WEBAPP_1_IP

    subconfig.vm.provider "virtualbox" do |virtualbox|
      # Customize the amount of memory on the VM:
      virtualbox.memory = "2048"
      virtualbox.cpus = "2"
      # Enable promiscuous mode
      virtualbox.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
    ## Now Provision Software Using Ansible
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/jdk8-1-playbook.yml"
    end
  end

  #################### Java App Server 2 #######################
  config.vm.define "webapp02" do |subconfig|
    subconfig.vm.box = UBUNTU_BIONIC64
    subconfig.vm.box_url = UBUNTU_BIONIC64_URL
    subconfig.vm.hostname = "webapp02.local"
    subconfig.vm.network :private_network, ip: WEBAPP_2_IP

    subconfig.vm.provider "virtualbox" do |virtualbox|
      # Customize the amount of memory on the VM:
      virtualbox.memory = "2048"
      virtualbox.cpus = "2"
      # Enable promiscuous mode
      virtualbox.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    end
    ## Now Provision Software Using Ansible
    subconfig.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/jdk8-2-playbook.yml"
    end
  end
end
