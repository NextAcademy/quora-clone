  
helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

	def logged_in?
		!current_user.nil?
  end

  def profile_access?(id)
    session[:user_id] == id.to_i  
  end

  def home_page?(id)
    id.to_s.empty? 
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

  def displayQuestion(question)
    erb(:'components/question', :locals => {:row => question}, layout: false)
  end

  def displayLatestQuestions()
    list = Question.order(created_at: :desc).limit(10)
    erb(:'components/all_questions', :locals => {:questions => list}, layout: false)
  end
end