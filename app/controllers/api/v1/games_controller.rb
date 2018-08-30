module Api
  module V1
    class GamesController < ActionController::API
      def show
        game = Game.find_by(id: params[:id])
        if game.nil?
           render status: 400, json: {message: "Bad Request."}.to_json
        else
          render json: game
        end
      end
    end
  end
end
