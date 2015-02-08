name             'uchiwa-sensu'
maintainer       'Simon Plourde'
maintainer_email 'simon.plourde@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures uchiwa-sensu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "rabbitmq", ">= 2.0.0"
depends "sensu", ">= 1.0.0"
depends "redisio", ">= 1.7.0"
