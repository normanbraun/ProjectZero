Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/trusty64"
    config.vm.synced_folder "vm/", "/vm"

    config.vm.provider :virtualbox do |vb|

        # Boot with headless mode
        vb.gui = false

        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize ["modifyvm", :id, "--memory", "2048"]

    end

    config.vm.network :forwarded_port, host: 8080, guest: 8080
    config.vm.network :forwarded_port, host: 80, guest: 80

    config.vm.provision "shell", inline: "/vm/provision.sh"
    config.vm.provision "shell", inline: "/vm/provision-always.sh", run: "always"

end