post "/questions/:id/answers" do
  @answer = Answer.new(answer_text: params[:answer][:answer_text], user_id: current_user.id, question_id: params[:id])
  @answer.save
  if @answer.save
    redirect "questions/#{params[:id]}"
  end
end
