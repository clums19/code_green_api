class MessagesController < ApplicationController
    def index
        messages = Message.order('created_at DESC')
        render json: {status: 200, messages: messages}
    end

    def show
        message = Message.find(params[:id])
        render json: {status: 200, message: message}
    end

    def create
        message = Message.new(message_params)
        if message.save
            render json: { status: 201, message: message }
        else
            render json: {status: 422, message: message, error: message.errors}
        end
    end

    def update
        message = Message.find(params[:id])
        message.update(message_params)
        render json: { message: message, status: 201}

    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: { message: message, status: 204 }
    end

    private
        def message_params
            params.require(:message).permit(:message, :topic, :name)
        end

end