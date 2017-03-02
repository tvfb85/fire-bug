require 'sinatra/base'

class Firebug < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/player_names' do
    @player_one_name = params[:player_one_name]
    @player_two_name = params[:player_two_name]
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
