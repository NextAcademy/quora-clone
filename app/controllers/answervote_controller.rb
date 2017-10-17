post '/homepage/vote' do
	if params[ :type] == "up"
		a= 1
	else
		a=-1
	end
	answervote= Questionvote.new(user_id:current_user.id, answer_id: params[ :aid], vote_type: a)
	if answervote.save
		return "success".to_json
	else
		status 400
		return answervote.errors.full_messages.join(", ").to_json 
	end
end
