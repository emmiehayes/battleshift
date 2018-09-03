class Api::V1::Games::ShotsController < ApiController

  def create
    @game = Game.find(params[:game_id].to_i)
    return render status: 401, json: @game, message: "Unauthorized" unless actual_player?
    return render status: 400, json: @game, message: "Invalid move. Game over." if @game.winner
    if correct_player?
      player_take_your_shot
    elsif incorrect_player?
      render status: 400, json: @game, message: "Invalid move. It's your opponent's turn"
    end
  end

  private

  def actual_player?
    request.env["HTTP_X_API_KEY"] == @game.player_1 || request.env["HTTP_X_API_KEY"] == @game.player_2
  end

  def correct_player?
    (@game.current_turn == "player_1" && request.env["HTTP_X_API_KEY"] == @game.player_1) || (@game.current_turn == "player_2" && request.env["HTTP_X_API_KEY"] == @game.player_2)
  end

  def incorrect_player?
    (@game.current_turn == "player_2" && request.env["HTTP_X_API_KEY"] != @game.player_2) || (@game.current_turn == "player_1" && request.env["HTTP_X_API_KEY"] != @game.player_1)
    @game.save
  end

  def player_take_your_shot
    @turn_processor = TurnProcessor.new(@game, params[:shot][:target])
    @turn_processor.run!
    @turn_processor.switch_turn
    @game.save
    if invalid_coordinates?
      render status: 400, json: @game, message: "Invalid coordinates."
    elsif game_over?
      @turn_processor.announce_winner
      render status: 400, json: @game, message: "Your shot resulted in a Hit. Battleship sunk. Game over."
    else
      render json: @game, message: @turn_processor.message
    end
  end

  def invalid_coordinates?
    @turn_processor.message.include?('Invalid coordinates')
  end

  def game_over?
    @turn_processor.message.include?('Game over')
  end
end
