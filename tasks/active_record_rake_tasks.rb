# frozen_string_literal: true

# Add the ability to run db:create/migrate/drop etc

# database framework / helpers
require 'active_record'
require 'yaml'
require 'erb'

# FIXME: can this be done differently ?
# rubocop:disable Style/MixinUsage
include ActiveRecord::Tasks
# rubocop:enable Style/MixinUsage

DatabaseTasks.env = ENV['ENV'] || 'development'

root = File.expand_path('..', __dir__)
DatabaseTasks.root = root
DatabaseTasks.db_dir = File.join(root, 'db')
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]

config_database_file_content = IO.read(File.join(root, 'config/database.yml'))
DatabaseTasks.database_configuration = YAML.load(ERB.new(config_database_file_content).result, aliases: true)

ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
ActiveRecord::Base.establish_connection(DatabaseTasks.env.to_sym)

load 'active_record/railties/databases.rake'
