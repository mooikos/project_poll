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

# connection & migrate (if needed)
require_relative 'database'

# project poll app
class ProjectPoll < Sinatra::Base
  require_relative 'models/user'
  require_relative 'support/telegram_client'
  require_relative 'use_cases/base'
  require_relative 'use_cases/user_subscribe'
  require_relative 'use_cases/user_unsubscribe'

  # start the background job loop
  require_relative 'background_jobs/base'

  get '*' do
    [404, 'Sorry page not found!!']
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
