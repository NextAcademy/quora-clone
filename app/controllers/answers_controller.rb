post '/questions/:question_id/answers' do

	answer = Answer.new(user_id:session[:user_id], question_id:params[:question_id], content: params[:content])

	if answer.save
		puts "answer success"
		redirect "/questions/#{params[:question_id]}"
	else
		puts "answer failure"		
	end
end

get '/users/:user_id/answers' do
	@answers = Answer.where(user_id: params[:user_id])
	erb :"answer/index"
end
