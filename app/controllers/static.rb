enable :sessions

get '/' do
  erb :"static/index"
end

get '/signup' do
  erb :"static/signup"
end

post '/signup' do
   user = User.new(params[:user])

  if user.save
    redirect "users/#{user.id}"
  else
    erb :"static/signup"
  end
end

get '/users/:id' do
  # some code here
  @user = User.find_by_id(params[:id])
  erb :"users/profile"
end

get '/login' do
  erb :"static/login"
end

post '/login' do
 user = User.find_by_email(params[:user][:email])
  if !user.nil? && user.try(:authenticate, params[:user][:password])
    #if params[:password] == user_id
    #flash[:msg] = "ACCESS GRANTED"
    #redirect "/" 
    session[:user_id] = user.id
    redirect "/"
  else
  	flash[:msg] = "ACCESS DENIED"
    erb :"static/login"
  end
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
   session[:user_id] = nil
  #session.delete("user")
   redirect '/'

end

#get /transactions/1/payments/new
#params[:user_id] = 1
#params[:transaction_id] = 1
#do not go through 2 levels of models 
#payments belongs_to transaction

# Between 2 levels
# http verb          resource/path              restful action
# get			/books/1/authors/1		              show
# get			/books/1/authors/new			      new
# post		/books/1/authors			         create
# get			/books			                      index
# get			/magazines/1/authors/1/edit		       edit
# put/patch	/books/1/authors/1			          update
# delete		/books/1/authors/1	                 destroy








