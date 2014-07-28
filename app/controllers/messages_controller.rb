class MessagesController < ApplicationController

	def new
		@message = Message.new() 
	end

	def index
		@messages = current_user.messages
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy()
		redirect_to messages_path, :notice => "Your message was deleted"
	end

	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.id
		if @message.save 
			redirect_to messages_path, :notice => "Your message has been sent"
			else 
				render 'new'
		end
	end

	private

		def message_params
			params.fetch(:message, {}).permit(:title, :content)
		end
end
