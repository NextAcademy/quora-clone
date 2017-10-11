
# CREATE - CREATE
post '/signup' do
  user = User.new(params[:user])
  if user.save
  	redirect "/users/#{user.id}"
  else
  	# what should happen if the user keyed in invalid data?
  	redirect '/'
   end
end


#READ - SHOW
get '/users/:id' do
	@user = User.find(params[:id])

	erb :"users/show"

end

