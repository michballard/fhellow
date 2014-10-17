class Message < ActiveRecord::Base
	def self.get_message_between(current_user, other_user_id)
		conversation_code = [current_user.id, other_user_id.to_i].sort.join("-")
		conversation = where(:conversation_code => conversation_code).all
		conversation = conversation.sort{|a,b| a.created_at <=> b.created_at}
		if conversation.last && conversation.last.from_id != current_user.id
			conversation.map {|m| m.seen = true}
			conversation.last.save
		end
		conversation
	end

	def self.get_all_messages_for(user)
		# get the last message from each conversation the user has had
		from = where(:from_id => user)
		to = where(:to_id => user)
		all = from + to
		all.sort{|a,b|b.created_at <=> a.created_at}.uniq{|a|a.conversation_code}		
	end
end
