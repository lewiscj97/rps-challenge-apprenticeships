require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
  get '/test' do
    'test page'
  end

  get '/' do
    erb :index
  end

  get '/two_player' do
    erb :two_player
  end

  get '/single_player' do
    erb :single_player
  end

  post '/two_player' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @game = Game.create(player1, player2)
    redirect to('/two_player_game')
  end

  post '/player' do
    player = Player.new(params[:name])
    @game = Game.create(player)
    redirect to('/game')
  end

  before do
    @game = Game.instance
  end

  get '/game' do
    @name = @game.player.name
    erb :game
  end

  get '/two_player_game' do
    @player1 = @game.player.name
    @player2 = @game.player2.name
    erb :player1
  end

  post '/choice' do
    choice = params[:choice]
    @game.player_choice(choice)
    redirect to('/result')
  end

  post '/player1_choice' do
    choice = params[:choice]
    @game.player_choice()
  end

  get '/result' do
    @player_choice = @game.player.choice
    @computer_choice = @game.computer_choice
    @winner = @game.decide_winner(@player_choice, @computer_choice)
    erb :result
  end

  run! if app_file == $0
end
