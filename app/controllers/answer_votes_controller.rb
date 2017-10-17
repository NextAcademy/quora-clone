post '/answers/:id/up' do

  @vote = AnswerVote.find_by(answer_id: params[:id], user_id: current_user.id)
  	
  	if @vote != nil
	  	
	  	if @vote.points == 1
  			@vote.destroy
  		elsif @vote.points == -1
		  	@vote.update_attributes(points: 1) #updates to upvote (not mathematically add 1 to points)
		  end
		
		else
			@vote = AnswerVote.create(answer_id: params[:id], user_id: current_user.id, points: 1)
		end
		
		redirect back

end


post '/answers/:id/down' do

  @vote = AnswerVote.find_by(answer_id: params[:id], user_id: current_user.id)
  	
  	if @vote != nil
	  	
	  	if @vote.points == -1
  			@vote.destroy
  		elsif @vote.points == 1
		  	@vote.update_attributes(points: -1)
		  end
		
		else
			@vote = AnswerVote.create(answer_id: params[:id], user_id: current_user.id, points: -1)
		end

		redirect back

end