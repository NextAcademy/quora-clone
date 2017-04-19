require 'byebug'

get '/' do
  erb :"static/top"
end

post '/signup' do
	user = User.new(params[:user])

	if user.save	
		puts "signin saved"
		session[:user_id] = user.id
		redirect "/questions"
	else
		puts "signin error"
		@errors =user.errors.full_messages.join(", ")
		erb :"static/top"

	end
end

post '/login' do

	user_db = User.find_by_email(params[:user][:email])

	if !user_db.nil?
		#byebug
		if user_db.password == params[:user][:password]
			puts "authentication success"
			session[:user_id] = user_db.id

			redirect "/questions"
		else
			puts "authentication failure"
		end
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect "/"
end


# url						 description		  directory structure
# /questios                all questions 		  view/static/index.erb (homepage)
# /users/1/questions      only my questions     view/question/index.erb
# /question/:q_id/answers all answers to a question view/question/show.erb
# /users/1/answers        only my answers     view/answer/index.erb


