get '/askquesiton' do
  redirect '/'
end

post '/askquestion' do
  #current_user
  if logged_in?
    test = Question.new(user_id: session[:user_id], content: params[:content])
    if test.save
      'Success'
    else
      status(400)
      body('400: Malformed post')
    end
  else
    status(400)
    body('400: Not logged in')
  end
end

HITS_PER_PAGE = 10

# remove this route as main page will link here
get '/main' do
  erb :'users/main', layout: :'layouts/userpage'

end