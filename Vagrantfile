# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|
    # configure the boxes
    config.vm.box = "bento/ubuntu-17.04"

    #
    # Docker node
    #
    config.vm.define 'docker' do |d1|
        d1.vm.hostname = 'docker'
        d1.vm.network "private_network", ip: "172.20.20.10"
        d1.vm.provision "shell", privileged: true, path: "install_ansible_agt.sh"
    end

    #
    # Ansible controller node
    #
    config.vm.define 'controller' do |controller|
        controller.vm.hostname = "controller"
        controller.vm.network "private_network", ip: "172.20.20.99"
        controller.vm.provision "shell", privileged: true, inline: <<-EOF
            sudo apt-get update -y
            
            # Good tools to have
            sudo apt-get install -y tree htop

            # Setup vim profile
            cp /vagrant/.vimrc ~/
        EOF
        controller.vm.provision "shell", privileged: true, path: "install_ansible_ctl.sh"
    end
end