# users- create- new action
get '/signup' do
  erb :"users/signup"
end


# users- create- create action
post '/signup' do
  user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if user.save
    erb :"users/login"
  else
    # @errors = user.errors.messages
    erb :"users/signupfail"
  end
end

get '/profile/:id' do
  @user = User.find_by_id(params[:id])
  @question = Question.all.order('created_at DESC')
  @answer = Answer.all.order('created_at DESC')
  erb :"users/profile"
end

get '/profile/:id/edit' do

end

patch '/profile/:id' do

end

delete 'profile/:id' do

end
