module NotificationsHelper


  def notifications
    i = 0

    my_conversations = Conversation.where('sender_id = ? OR recipient_id = ?', current_user.id, current_user.id)
    my_conversations.each do |convo|
      i = i + convo.messages.where(:recipient_id => current_user.id, :read => false).count
    end
    i
  end


end
