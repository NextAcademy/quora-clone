enable :sessions

post "/question/:id/upvote" do
  @vote = QuestionVote.new
  if current_user.vote("upvote", "question", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end

post "/question/:id/downvote" do
  if current_user.vote("downvote", "question", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end

post "/question/:id/remove-vote" do
  if current_user.remove_vote("question", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end


