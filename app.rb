require 'sinatra/base'
require './lib/player'
require './lib/game'

class Firebug < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/player_names' do
    player_one  = Player.new(params[:player_one_name])
    player_two  = Player.new(params[:player_two_name])
    $game = Game.new(player_one, player_two)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.opponent)
    @game.switch_turns
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
