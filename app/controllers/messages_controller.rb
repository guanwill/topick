class MessagesController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @user = User.all
    @conversations = Conversation.all

      @messages = @conversation.messages

      recipient_id = @conversation.recipient_id
      sender_id = @conversation.sender_id
      @recipient = User.find(recipient_id)
      @sender = User.find(sender_id)


      if @messages.size > 0
        @messages.each do |msg|
          if msg.recipient_id == current_user.id
            msg.update(:read => true)
          end
        end
      end

      if @messages.length > 20
        @over_ten = true
        @messages = @messages[-20..-1]
      end

      if params[:m]
        @over_ten = false
        @messages = @conversation.messages
      end

      @c_id = params[:conversation_id]

      @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversations_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :sender_id, :recipient_id)
  end

  def destroy
    @conversation = Message.find(params[:conversations_id])
    @conversation.destroy
    redirect_to conversations_path
  end

end
