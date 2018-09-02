class Api::V1::Games::ShipsController < ApiController

  def create
    game = Game.find(params[:game_id].to_i)

      player_1_ships = ShipPlacer.new(params, game.player_1_board)
      player_1_ships.run
      
      player_2_ships = ShipPlacer.new(params, game.player_2_board)
      player_2_ships.run
    
    game.save

    render json: game, message: player_1_ships.message
  end

end
