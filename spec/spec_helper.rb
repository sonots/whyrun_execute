# Added by ChefSpec
require 'chefspec'

# Uncomment to use ChefSpec's Berkshelf extension
# require 'chefspec/berkshelf'

RSpec.configure do |config|
  # Specify the path for Chef Solo to find cookbooks
  config.cookbook_path = %w(vendor/cookbooks ..)

  # Specify the path for Chef Solo to find roles
  # config.role_path = '/var/roles'

  # Specify the Chef log_level (default: :warn)
  # config.log_level = :debug

  # Specify the path to a local JSON file with Ohai data
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from
  # config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from
  # config.version = '12.04'
end

def stub_kickhost(host = '127.0.0.1', &block)
  tmp = ENV['SSH_CLIENT']
  ENV['SSH_CLIENT'] = "#{host} 54352 22"
  yield
  ENV['SSH_CLIENT'] = tmp
end
