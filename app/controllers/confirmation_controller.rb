class ConfirmationController < ApplicationController

  def show
    @user = User.find_by_email_token(params[:id])
    if @user
      @user.email_activate
    else
      redirect_to '/register'
    end
  end
end
