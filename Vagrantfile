Vagrant.configure("2") do |gconfig|

  gconfig.vm.define "server-0.12.6" do |config|
    config.vm.hostname = "server-0-12-6"
    config.vm.box = "centos65"
    config.vm.network :private_network, ip: "10.20.30.40"
    config.vm.network :public_network
    config.berkshelf.enabled = true
    config.omnibus.chef_version = :latest

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.network :forwarded_port, guest: 8080, host: 8088
    config.vm.network :forwarded_port, guest: 4567, host: 8888

    config.vm.provision "shell", inline: "sudo /etc/init.d/sensu-api restart && sudo /etc/init.d/sensu-client restart"

    config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.data_bags_path = 'data_bags'
      chef.json = {
        "sensu" => {
          "version" => "0.12.6-4",
          "use_embedded_ruby" => true,
          "rabbitmq" => {
            "host" => "10.20.30.40"
          },
          "api" => {
            "host" => "10.20.30.40"
          }
        },
        "yum" => {
          "erlang_solutions" => {
            "baseurl" => "http://packages.erlang-solutions.com/rpm/centos/6/$basearch"
          }
        }
      }
      chef.run_list = [
        "recipe[uchiwa-sensu::server]",
        "recipe[uchiwa-sensu::client]"
      ]
    end
  end

  gconfig.vm.define "server-0.13.0" do |config|
    config.vm.hostname = "server-0-13-0"
    config.vm.box = "centos65"
    config.vm.network :private_network, ip: "10.20.30.41"
    config.vm.network :public_network
    config.berkshelf.enabled = true
    config.omnibus.chef_version = :latest

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.network :forwarded_port, guest: 8080, host: 8089
    config.vm.network :forwarded_port, guest: 4567, host: 8889

    config.vm.provision "shell", inline: "sudo /etc/init.d/sensu-api restart && sudo /etc/init.d/sensu-client restart"

    config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.data_bags_path = 'data_bags'
      chef.json = {
        "sensu" => {
          "version" => "0.13.0-1",
          "use_unstable_repo" => true,
          "use_embedded_ruby" => true,
          "rabbitmq" => {
            "host" => "10.20.30.41"
          },
          "api" => {
            "host" => "10.20.30.41"
          }
        },
        "yum" => {
          "erlang_solutions" => {
            "baseurl" => "http://packages.erlang-solutions.com/rpm/centos/6/$basearch"
          }
        }
      }
      chef.run_list = [
        "recipe[uchiwa-sensu::server]",
        "recipe[uchiwa-sensu::client]"
      ]
    end
  end

end
