class MessagesController < ApplicationController
    def index
        @messages = Message.order('created_at DESC')
        render json: {status: 200, messages: @messages}
    end
    def show
        found_message = Message.find(params[:id])
        render json: {status: 200, message: found_message}
    end

    def create
        message = Message.new(message_params)
        if message.save
            render json: { message: message }
        else
            render(status: 422, json: { message: message, errors: message.errors })
        end
    end

    private

    def message_params
        params.require(:message).permit(:message, :topic, :name)
    end

end