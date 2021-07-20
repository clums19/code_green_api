class MessagesController < ApplicationController
    before_action :set_notice, only: [:show, :update, :destroy]
    
    def index
        @messages = Message.all

        render json: @messages.to_json(include: :user)
    end

    def show
        render json: @message
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            render json: @message, status: :created, user: @message
        else
            render json: @message.errors, status: :unprocessable_entity
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
            params.require(:message).permit(:content, :topic, :user_id)
        end

        def set_message
            @message = Message.find(params[:id])
        end

end