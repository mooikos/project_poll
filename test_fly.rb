# test_heroku.rb

require 'sinatra/base'

class TestFly < Sinatra::Base
  get "*" do
    [404, "Sorry page not found!!"]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
