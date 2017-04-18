require 'byebug'
enable :sessions
######################

## NEW

=begin

METHOD 1
========
get '/users/:id/questions/new'
end

This is correct by convention. But is it necessary to get into the USER page to post a question? 

Not necessary.

=end

# METHOD 2

get '/questions/new' do
	erb :"question/new"
end

post '/questions/new' do
	byebug
	question = Question.new(text: params[:question][:text])
	question.user_id = current_user.id  # use HELPER method

	if question.save
		flash[:msg] = "Congrats!"
		redirect '/'
	else
		flash[:msg] = question.errors.full_messages.join('<br> ')
		redirect '/questions/new'
	end
end

######################

get '/questions/:id'

	id = params[:question][:id]
	@question = Question.find(id)

	if @question.nil?
		flash[:msg] = "What you are looking for doesn't exist. Create one now!"
		redirect '/questions/new'
	else
		erb :"question/show"
	end
end

