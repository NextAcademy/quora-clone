require 'byebug'
enable :sessions
######################

# New & create - must be under a question

=begin
# get '/questions/:id' do
# 	id = params[:question][:id]
# 	@question = Question.find(id)
# 	erb :"question/show"
# end
=end

post '/questions/:id/answers' do
	# byebug
	answer = Answer.new(text: params[:answer][:text])
	answer.user_id = current_user.id

	# params ==> {"answer"=>{"text"=>"what kinda questions is thissss?!?!?!!?"}, 
	# "splat"=>[], "captures"=>["1"], "id"=>"1"}

	# the "id" is not under "answer"!! read properly
	answer.question_id = params[:id]

	if answer.save
		flash[:msg] = "Thanks for your answers!"
	else
		flash[:msg] = answer.errors.full_messages.join('<br> ')
	end
	redirect "/questions/#{answer.question_id}"
end