require 'byebug'

post '/answer_votes' do
	# puts params

	@user_id = params[:answer_vote][:user_id].to_i
	@answer_id = params[:answer_vote][:answer_id].to_i
	user_voted = AnswerVote.find_by(user_id: @user_id, answer_id: @answer_id)

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
		redirect back
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
		@question_votes = QuestionVote.where(question_id: @question.id).sum(:vote)
		@answer_votes = AnswerVote.where(answer_id: @answer.id).sum(:vote)
		erb :"static/question"	

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