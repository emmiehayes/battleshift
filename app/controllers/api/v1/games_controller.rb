module Api
  module V1
    class GamesController < ActionController::API

      def create 
        @user_1 = User.find_by_api_key(response.request.env["HTTP_X_API_KEY"]) #sophie
        @user_2 = User.find_by_email(params[:opponent_email]) #michelle
        binding.pry

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
  end
end