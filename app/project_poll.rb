# frozen_string_literal: true

# debugger
require 'pry-byebug'

# require .env configuration
require 'dotenv/load'

# application framework
require 'sinatra/base'

# database library
require 'sequel'
# require_relative 'database'

DB = Sequel.connect(
  adapter: :postgres,
  user: ENV.fetch('DATABASE_USER'),
  password: ENV.fetch('DATABASE_PASSWORD'),
  host: ENV.fetch('DATABASE_HOST'),
  port: ENV.fetch('DATABASE_PORT', 5432),
  database: ENV.fetch('DATABASE_DATABASE')
)

DB.create_table :events do
  primary_key :id
end

# project poll app
class ProjectPoll < Sinatra::Base
  get '*' do
    binding.pry

    # database_connection = DatabaseConnection.new.connection

    [404, 'Sorry page not found!!']
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
