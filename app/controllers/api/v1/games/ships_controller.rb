class Api::V1::Games::ShipsController < ApiController

  def create
    game = Game.find(params[:game_id].to_i)
    # refactor private method game_id to_i

    game.set_starter

    place_ship = ShipPlacer.new(params, game.player_1_board)
    place_ship.run
    # require "pry"; binding.pry
    render json: game, message: place_ship.message
  end

end
