class Api::V1::GamesController < ActionController::API

  def create
    
    user_1 = User.find_by_api_key(request.env["HTTP_X_API_KEY"]) #sophie
    user_2 = User.find_by_email(params[:opponent_email]) #michelle

    board = Board.new

    player_1 = Player.new(user_1, board)
    player_2 = Player.new(user_2, board)
    
    game = Game.new
    game.player_1_board = player_1.board
    game.player_2_board = player_2.board
    game.player_1 = player_1.api_key
    game.player_2 = player_2.api_key
    game.save
  
    render json: game
  end

  def index
  end

  def show
    game = Game.find_by(id: params[:id])
    if game.nil?
      render status: 400, json: {message: "Bad Request."}.to_json
    else
      render json: game
    end
  end
end
