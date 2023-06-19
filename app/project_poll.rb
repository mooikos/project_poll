# frozen_string_literal: true

# debugger
require 'pry-byebug'

# require .env configuration
require 'dotenv/load'

# application framework
require 'sinatra/base'

# database library & connection
require 'sequel'

# rest client
require 'rest-client'

# connection
DB = Sequel.connect(
  adapter: :postgres,
  user: ENV.fetch('DATABASE_USER'),
  password: ENV.fetch('DATABASE_PASSWORD'),
  host: ENV.fetch('DATABASE_HOST'),
  port: ENV.fetch('DATABASE_PORT', 5432),
  database: ENV.fetch('DATABASE_DATABASE'),
  search_path: ENV.fetch('DATABASE_SCHEMA')
)

# migrations
begin
  DB.create_table :users do
    primary_key :id
    String :name
  end
rescue Sequel::DatabaseError => _e
  # already created
end

begin
  DB.create_table :events do
    primary_key :id
    String :name
  end
rescue Sequel::DatabaseError => _e
  # already created
end


# project poll app
class ProjectPoll < Sinatra::Base
  require_relative 'background_jobs/base'

  get '*' do
    [404, 'Sorry page not found!!']
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
