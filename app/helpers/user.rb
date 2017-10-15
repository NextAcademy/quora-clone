  
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
    erb(:'/components/reply', :locals => {:questionId => id}, layout: false)
  end
  
  def displayAnswer(id)
    @answerId = id
    erb(:'components/answer', layout: false)
  end

  def displayAllAnswers(question)
    erb(:'components/all_answers', :locals => {:question => question}, layout: false)
  end

  def displayQuestion(id)
    #erb()
  end
end