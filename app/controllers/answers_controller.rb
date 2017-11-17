get '/:id' do
	id = params[:id]
	@question = Question.find(id)
	# @question = Question.find_by(user_id:id)
	erb :"answers/show"
end

# get "/answers/show" do
# 	erb :"answers/show"
# end 