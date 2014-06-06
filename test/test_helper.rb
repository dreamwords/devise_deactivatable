ENV["RAILS_ENV"] = "test"
require "devise"
require "devise/version"
require "active_support/core_ext/module/attribute_accessors"

require "devise_deactivatable"

require "rails_app/config/environment"
require "rails/test_help"

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)

ActiveRecord::Migrator.migrate(File.expand_path("test/rails_app/db/migrate"))

module Support
  autoload :Factories, 'helpers/factories'
end