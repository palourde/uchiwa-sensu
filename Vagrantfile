Vagrant.configure("2") do |gconfig|

  gconfig.vm.define "0.12.6" do |config|
    config.vm.hostname = "server-0-12-6"
    config.vm.box = "opscode-centos-6.5"
    config.vm.network :private_network, ip: "10.20.30.40"
    config.omnibus.chef_version = "11.4.0"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

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

    config.vm.provision "shell", inline: "sudo /etc/init.d/sensu-api restart && sudo /etc/init.d/sensu-client restart"
  end

  gconfig.vm.define "0.16.0" do |config|
    config.vm.hostname = "server-0-16-0"
    config.vm.box = "opscode-centos-6.5"
    config.vm.network :private_network, ip: "10.20.30.41"
    config.omnibus.chef_version = "11.4.0"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.data_bags_path = 'data_bags'
      chef.json = {
        "sensu" => {
          "version" => "0.16.0-1",
          "use_embedded_ruby" => true,
          "rabbitmq" => {
            "host" => "10.20.30.41"
          },
          "api" => {
            "host" => "10.20.30.41",
            "user" => "admin",
            "password" => "secret"
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

    config.vm.provision "shell", inline: "sudo /etc/init.d/sensu-api restart && sudo /etc/init.d/sensu-client restart"
  end

end
