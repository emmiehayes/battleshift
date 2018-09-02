class Api::V1::Games::ShotsController < ApiController
  
  def create
    game = Game.find(params[:game_id].to_i)
    if (game.current_turn == "player_1" && request.env["HTTP_X_API_KEY"] == game.player_1) || (game.current_turn == "player_2" && request.env["HTTP_X_API_KEY"] == game.player_2)
      turn_processor = TurnProcessor.new(game, params[:shot][:target])
      turn_processor.run!
      turn_processor.switch_turn
      game.save
      if turn_processor.message.include?('Invalid coordinates')
        render status: 400, json: game, message: "Invalid coordinates." 
      else
        render json: game, message: turn_processor.message
      end
    elsif (game.current_turn == "player_2" && request.env["HTTP_X_API_KEY"] != game.player_2) || (game.current_turn == "player_1" && request.env["HTTP_X_API_KEY"] != game.player_1)
      game.save
      render status: 400, json: game, message: "Invalid move. It's your opponent's turn"
    end 
  end
end