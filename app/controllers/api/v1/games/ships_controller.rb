class Api::V1::Games::ShipsController < ApiController

  def create
    game = Game.find(params[:game_id].to_i)
    # refactor private method game_id to_i

    placed_ship = ShipPlacer.new(params, game.player_1_board)
    placed_ship.run
    render json: game, message: placed_ship.message
  end
  
end
