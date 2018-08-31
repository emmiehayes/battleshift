module Api
  module V1
    module Games
      class ShipsController < ApiController
        def create 
          game = Game.find(params[:game_id].to_i)
          game.set_starter
          render json: game
        end
      end 
    end
  end
end