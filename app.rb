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
    @game = Game.create(player_one, player_two)
    redirect '/play'
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  get '/attack' do
    @game.attack(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:attack)
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
