enable :sessions

get '/' do
  erb :"static/index"
end


# Between 2 levels
# http verb          resource/path              restful action
# get			/books/1/authors/1		              show
# get			/books/1/authors/new			      new
# post		    /books/1/authors			          create
# get			/books			                      index
# get			/magazines/1/authors/1/edit		       edit
# put/patch	    /books/1/authors/1			           update
# delete		/books/1/authors/1	                 destroy








