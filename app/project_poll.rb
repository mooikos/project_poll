# frozen_string_literal: true

require 'sinatra/base'

# project poll app
class ProjectPoll < Sinatra::Base
  get '*' do
    [404, 'Sorry page not found!!']
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end