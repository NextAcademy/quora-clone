helpers do
	def current_user(session_id)
		User.find_by(id: session_id)
	end

	def is_logged_in?(session_id)

	end
end