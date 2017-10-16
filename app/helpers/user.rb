  
helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end


	def logged_in?
		!current_user.nil?
  end

  def displayReply(id)
    @questionId = id.to_s
    erb(:'/components/reply', layout: false)
  end
  
  def displayAnswer(id)
    @answerId = id
    erb(:'components/answer', layout: false)
  end

  def displayQuestion(id)
    #erb()
  end
end