#!/usr/bin/env ruby
require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'sensu-plugin/check/cli'

class CheckReturn < Sensu::Plugin::Check::CLI
  option :code,
    :short => "-c CODE",
    :long => "--code CODE",
    :description => "Return Code",
    :required => true

  def run
    if config[:code] == "0"
      ok "Success"
    elsif config[:code] == "1"
      warning "Warning"
    elsif config[:code] == "3"
      unknown "Unknown"
    else
      critical "Error"
    end
  end
end
