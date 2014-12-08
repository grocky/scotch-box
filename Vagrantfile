# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Box
  config.vm.box = "scotch/box"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  # Networking
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "vagrant"

  # Sync
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Chef
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.ssh.forward_agent = true
  config.vm.provision :chef_solo do |chef|    
    chef.data_bags_path = "data_bags"    

    # Recipes
    chef.add_recipe "scotch-extensions"
    chef.add_recipe "scotch-extensions::wordpress"
    chef.add_recipe "scotch-extensions::sites"
     
  end
  
end