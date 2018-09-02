class ApiController < ActionController::API
  def current_user 
    @user ||= User.find_by_api_key(response.request.env["HTTP_X_API_KEY"]) 
  end
end
