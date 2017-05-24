get '/likes/:id' do
    x = Question.find(params[:id])
    x.save
        arr = []
        yo = QuestionVote.new(value: 'up', user_id: session[:user_id], question_id: params[:id])
        QuestionVote.where(question_id: params[:id], value: 'up').each do |com|
            arr << com.user_id
        end
        if arr.include?(session[:user_id])
        else
            yo.save
        end
    redirect back
end

get '/dislikes/:id' do
    x = Question.find(params[:id])
    x.save
        arr = []
        yo = QuestionVote.new(value: 'down', user_id: session[:user_id], question_id: params[:id])
        QuestionVote.where(question_id: params[:id], value: 'down').each do |com|
            arr << com.user_id
        end
        if arr.include?(session[:user_id])
        else
            yo.save
        end
    redirect back
end
