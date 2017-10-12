# Not actually necessary, just if someone is poking at the javascript
# and they see that we're sending stuff to '/askquestion' this will
# redirect them to the main page
get '/askquesiton' do
  redirect '/'
end

post '/askquestion' do
  # Should add validation

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
  erb :'users/show', layout: :'layouts/userpage'
end