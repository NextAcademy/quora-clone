post '/users' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?

  else
    # what should happen if the user keyed in invalid date?

  end
end  