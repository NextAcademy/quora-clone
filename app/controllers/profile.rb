get '/profile/:id' do
	erb :'users/profile', layout: :'layouts/profile'
end

get '/profile/:id/answers' do
	erb :'users/profile_answers', layout: :'layouts/profile'
end