get '/signup' do

erb :"static/index"

end

post '/signup' do
    user1 = User.new(params[:user])

    if user1.save
        #validate name,email, password, then (user.rb validation)
    user1.name     = params[:user][:name]
    user1.email    = params[:user][:email]
    user1.password = params[:user][:password]

    # "Successful! You now have an account at Quora"
    else
        #on frontend (use ajax?) show please check for following errors
    end

    erb :"static/index"

end


post '/login' do
    a = User.find_by(email: params[:user][:email])
    if !a.nil? && a.authenticate(params[:user][:password])
       redirect '/main'
    else
       redirect '/signup'
    end

end

# post '/logout' do

# end



get '/main' do

erb :"static/main"

end
