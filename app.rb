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

  # get '/attack' do
  #   @game.attack(@game.opponent)
  #   if @game.winner
  #     erb(:game_over)
  #   else
  #     erb(:attack)
  #   end
  # end

  get '/fire' do
    @game.fire(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:fire)
    end
  end

  get '/pink_unicorn' do
    @game.pink_unicorn(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:pink_unicorn)
    end
  end

  get '/popcorn' do
    @game.popcorn(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:popcorn)
    end
  end

  get '/beer' do
    @game.beer(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:beer)
    end
  end

  get '/grenade' do
    @game.grenade(@game.opponent)
    if @game.winner
      erb(:game_over)
    else
      erb(:grenade)
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
