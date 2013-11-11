Vagrant.configure("2") do |config|

  # Name and source for the box
  config.vm.box = "barcamp"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Forward ports into the box
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Synced folder
  config.vm.synced_folder "slides", "/home/vagrant/slides"

  # Set up the box with chef
  config.vm.provision "shell" do |s|
    s.inline = "apt-get update"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "barcamp::nginx"
    chef.add_recipe "barcamp::prompt"
  end

end
