require 'byebug'

post '/answer_votes' do
	# puts params

	@user_id = params[:answer_vote][:user_id].to_i
	@answer_id = params[:answer_vote][:answer_id].to_i
	@question_id = Answer.find_by(id: @answer_id).question_id
	user_voted = AnswerVote.find_by(user_id: @user_id, answer_id: @answer_id)
	user_vote = params[:answer_vote][:vote].to_i

	unless user_voted
		answer_votes = AnswerVote.new(params[:answer_vote])
	else
		answer_votes = user_voted
		param_vote = params[:answer_vote][:vote].to_i
		unless answer_votes.vote == param_vote
			answer_votes.vote += param_vote
		end
	end

	if answer_votes.save
		# redirect back # to be commented out for json
		{ success: true, answer_id: @answer_id, vote: user_vote}.to_json
	else
		@answer_votes_errors = answer_votes.errors.messages
		# @user = User.all
		# @questions = Question.all
		# @answers = Answer.all
		# @question_votes = QuestionVote.all
		# @answer_votes = AnswerVote.all
		# erb :"static/index"

		@question = Question.find_by_id(@question_id)
		@title = @question.title + " - Quora Clone"
		@answers = Answer.where(question_id: @question.id).order(created_at: :desc)
		@user = User.all
		@question_votes = QuestionVote.all
		@answer_votes = AnswerVote.all
		# erb :"static/question" # to be commented out for json	
		{ answer_id: @answer_id, message: @answer_votes_errors }.to_json

		# @user = User.find_by_id(@user_id)
		# @title = @user.name + " - Quora Clone"
		# @answers_user = Answer.where(user_id: @user.id).order(created_at: :desc)
		# @questions_user = Question.where(user_id: @user.id).order(created_at: :desc)
		# @questions = Question.all
		# @question_votes = QuestionVote.all
		# @answer_votes = AnswerVote.all
		# erb :"static/profile"
	end
end