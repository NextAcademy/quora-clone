post "/answer/:id/upvote" do
  if current_user.vote("upvote", "answer", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end

post "/answer/:id/downvote" do
  if current_user.vote("downvote", "answer", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end

post "/answer/:id/remove-vote" do
  if current_user.remove_vote("answer", params[:id])
    redirect "/"
  else
    "ERROR"
  end
end