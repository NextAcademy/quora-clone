get '/' do
  if session[:user_id] = nil
   	erb :"static/index"
  else 
	erb :"static/main" 
  end
end

get '/main' do
	erb :"static/main"
end


# routing is like static.rb
# routes are stored in controllers
# RESTFUL Routes 
# post '/urls'
# 4 categories- CRUD
# 5 - GET POST PUT PATCH DELETE
# 7 actions - show new create index edit update destroy

# show a specific object (like show me a question)


# put/patch/delete are post request, with hidden field specification
# patch let u update a single attribute 
# like you want to update email then u just patch email

# put u have to write all the attribute  
# but put you want to update email then u have to update everything like u have to write down password although password still the same

# show me all the transaction for user1
# get /users/1/transaction


# can do transaction.find(1) for this 
# 	get /users/1/transaction

# login is assigning a session 
# a more restful way to do what we did 
# get /sessions/new 
# post /sessions (login)
# delete /sessions/1 (logout)

# http verb      resource/path       restful actions
# get              /articles/1           show  
# get              /articles/new         new
# post             /articles            create
# get              /articles             index
# get              /articles/1/edit       edit
# put/patch        /articles/1           update
# delete           /articles/1           destroy

# http verb      resource/path             restful actions
# get              /brands/1/products/1            show  
# get              /brands/1/products/new          new
# post             /brands/1/products            create
# get              /products                       index
# get              /brands/1/products/1/edit       edit
# put/patch        /brands/1/products/1           update
# delete           /brands/1/products/1           destroy


# books has many authors  ----
# authors has many books

# http verb      resource/path             restful actions
# get              /books/1/authors/1             show 
# get              /books/1/authors/new          new
# post             /books/1/authors            create  
# get              /books/1/authors              index 
# get              /books/1/authors/1/edit       edit
# put/patch        /books/1/authors/1           update
# delete           /books/1/authors/1          destroy 





