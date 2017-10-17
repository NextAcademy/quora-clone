get '/' do
  erb :"static/index"
end

get '/login' do
	erb :"static/login"
end


get '/homepage' do
	@questions= Question.paginate(:page => params[:page], :per_page => 2)
	erb :"static/homepage"
end

post '/homepage' do
	question = Question.new(user_id:current_user.id, question: params[:question], description: params[:description])
	question.save
	redirect '/homepage'
end

