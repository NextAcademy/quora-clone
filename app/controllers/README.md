app/controllers/*.rb
=================
This is your routing and logic folder. It starts with routing address and end with either
providing a view or redirection. This framework provides full flexibility and room for
customization.

you can create a controller ruby file, in this example, let's create 'users' routing:
```
# app/controllers/users.rb

get '/signup' do
	erb :'users/new'
end

post '/signup' do
	# Do something processing with user input
	redirect to '/user/dashboard'
end

get '/user/dashboard' do
	erb :dashboard
end
```

You can create many controller files as long as there is no conflicted routes. Sinatra go through
each controller file and compile all available route.