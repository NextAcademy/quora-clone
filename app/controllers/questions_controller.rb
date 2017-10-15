#CREATE - QUESTION
post '/questions' do
	@question = current_user.questions.new(params[:question])
	if @question.save
		redirect "/questions/#{@question.id}"
	else

	end

end

#READ - QUESTION
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show
end
