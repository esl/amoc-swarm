$install_pip = <<-'SCRIPT'
  #install pip3
  sudo apt-get update
  sudo apt-get install -y python3-pip  
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-20.04"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |vbox|
    vbox.linked_clone = true
    vbox.cpus = 1
    vbox.memory = 2048
  end
  config.vm.provision "docker", images: ["busybox"]
  config.vm.provision "shell", inline: $install_pip


  config.vm.define "ci", autostart: false do |ci|
    ci.vm.hostname = "ci.test"
    ci.vm.provision "shell", inline: "pip3 install ansible==4.2"
    ci.vm.synced_folder "./ansible", "/home/vagrant/ansible"
    ci.vm.network :private_network, ip: "10.0.0.10"
    ci.vm.provider :virtualbox do |vbox|
      vbox.name = "ci"
      vbox.memory = 4096
      vbox.cpus = 2
    end
  end

  (1..2).each do |i|
    config.vm.define "server-#{i}" do |server|
      server.vm.hostname = "server-#{i}.test"
      server.vm.synced_folder ".", "/vagrant", disabled: true
      server.vm.network :private_network, ip: "10.0.0.#{i + 10}"
      server.vm.provider :virtualbox do |vbox|
        vbox.name = "server-#{i}"
      end
    end
  end
  
end
