helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  # @current_user ||= User.find_by_id(session[:user_id])
  # is the same as
  # if @current_user.nil? == false           #=> if current user has something.
  #   @current_user                          #=> use whatever is in current_user
  # else
  #   User.find_by_id(session[:user_id])
  # end





  # Returns true if current_user exists. false otherwise
  def logged_in?
    !current_user.nil?
  end
end
