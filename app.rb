require 'sinatra/base'

class Firebug < Sinatra::Base
  get '/' do
    'Hello Fire Bug!!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
