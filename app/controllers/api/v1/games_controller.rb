class Api::V1::GamesController < ActionController::API

  def create
    user_1 = User.find_by_api_key(request.env["HTTP_X_API_KEY"]) #sophie
    user_2 = User.find_by_email(params[:opponent_email]) #michelle
    b1 = Board.new
    p1 = Player.new(user_1,b1)
    
    b2 = Board.new
    p2 = Player.new(user_2,b2)
    
    game = Game.new
    game.player_1_board = p1.board
    game.player_2_board = p2.board
    game.current_turn = "player_1"
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
      render json: g
    end
  end
end
