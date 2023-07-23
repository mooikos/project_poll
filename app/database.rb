# frozen_string_literal: true

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
