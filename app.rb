require 'sinatra/base'
require './lib/player'

class Firebug < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/player_names' do
    $player_one  = Player.new(params[:player_one_name])
    $player_two  = Player.new(params[:player_two_name])
    redirect '/play'
  end

  get '/play' do
    @player_one_name = $player_one.name
    @player_two_name = $player_two.name
    erb(:play)
  end

  get '/attack' do
    @player_one_name = $player_one.name
    @player_two_name = $player_two.name
    @player_one = $player_one
    @player_two = $player_two
    @player_one.attack(@player_two)
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
