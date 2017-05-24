get '/likes/:id' do
    x = Answer.find(params[:id])
    x.save
        arr = []
        yo = AnswerVote.new(value: 'up', user_id: session[:user_id], answer_id: params[:id])
        AnswerVote.where(question_id: params[:id], value: 'up').each do |com|
            arr << com.user_id
        end
        if arr.include?(session[:user_id])
        else
            yo.save
        end
    redirect back
end

get '/dislikes/:id' do
    x = Answer.find(params[:id])
    x.save
        arr = []
        yo = AnswerVote.new(value: 'down', user_id: session[:user_id], answer_id: params[:id])
        AnswerVote.where(question_id: params[:id], value: 'down').each do |com|
            arr << com.user_id
        end
        if arr.include?(session[:user_id])
        else
            yo.save
        end
    redirect back
end
