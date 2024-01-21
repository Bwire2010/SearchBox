# require_relative "boot"

# require "rails/all"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module ArticlesSearch
#   class Application < Rails::Application
#     # Initialize configuration defaults for originally generated Rails version.
#     config.load_defaults 7.0

#     # Configuration for the application, engines, and railties goes here.
#     #
#     # These settings can be overridden in specific environments using the files
#     # in config/environments, which are processed later.
#     #
#     # config.time_zone = "Central Time (US & Canada)"
#     # config.eager_load_paths << Rails.root.join("extras")
#   end
# end




# # config/application.rb

# require_relative "boot"

# require "rails/all"

# Bundler.require(*Rails.groups)

# module ArticlesSearch
#   class Application < Rails::Application
#     # ...

#     # Add the following block to configure CORS
#     config.middleware.insert_before 0, Rack::Cors do
#       allow do
#         origins '*'
#         resource '*', headers: :any, methods: [:get, :post, :options]
#       end
#     end

#     # ...
#   end
# end

# module ArticlesSearch
#   class Application < Rails::Application
#     # Other configurations...

#     # Add this line inside the class block
#     config.autoload_paths += %W(#{config.root}/lib)
#   end
# end

# config/application.rb

# config/application.rb

require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ArticlesSearch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Add the following block to configure CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    # Add this line inside the class block to configure autoload paths
    config.autoload_paths += Dir[Rails.root.join('app', 'lib', '{**}')]
    #config.autoload_paths << Rails.root.join('lib')
    # Other configurations...
  end
end

# config/application.rb

# Add this line at the end of the file
require Rails.root.join('lib', 'search_analytics.rb')
