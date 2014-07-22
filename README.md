# uchiwa-sensu cookbook

This cookbook provides a standard Sensu environment for E2E testing of [Uchiwa](https://github.com/palourde/uchiwa).

# Requirements

* [sensu](https://github.com/sensu/sensu-chef) >= 1.0.0

# Usage

You should start both Sensu servers with: `vagrant up`

Or, if required, you can only start a specific version:
```
vagrant up server-0.12.6

vagrant up server-0.13.0

```

# Recipes

### uchiwa-sensu::server

Installs Sensu server with specified version (`node['sensu']['version']`)

### uchiwa-sensu::client

Installs Sensu client

### uchiwa-sensu::checks

Installs mock checks for e2e testing

### uchiwa-sensu::plugins

Install mock plugin for e2e testing

# Author

Author:: Simon Plourde (<simon.plourde@gmail.com>)
