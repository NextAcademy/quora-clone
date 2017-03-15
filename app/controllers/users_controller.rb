# C for users
post '/signup' do
 # byebug
 @user = User.new(params[:user])
 if @user.save
   session[:user_id] = @user.id
   redirect "/users/#{session[:user_id]}"
 else
   redirect '/signup-failure'
 end
end

#read -show
get '/users/:id' do
  erb :"users/show"
end

#edit
get '/users/:id/edit'do
  erb :"users/edit"
end

post '/users/:id' do
  # remove empty strings
  # params[:user].each {|k, v| params[:user].delete(k) if v == ""}
  #
  # current_user.first_name = params[:user][:first_name]
  # current_user.last_name = params[:user][:last_name]
  # current_user.gender = params[:user][:gender]
  if current_user.update(params[:user])
    redirect "/users/#{current_user.id}/edit"
  end
end
