class Api::V1::Games::ShipsController < ApiController

  def create
    game = Game.find(params[:game_id].to_i)

    placed_ship = ShipPlacer.new(params, game.player_1_board)
    placed_ship.run
    x = ShipPlacer.new(params, game.player_2_board)
    x.run
    game.save

    render json: game, message: placed_ship.message
  end

end
