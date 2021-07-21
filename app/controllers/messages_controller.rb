class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :update, :destroy]
    # before_action :authorized
    
    def index
        @messages = Message.all
        render json: @messages.to_json(include: :user)
    end

    def show
        render json: @message.to_json(include: :user)
    end

    def create
        @message = Message.new(message_params)
        @message.user = @user
        
        if @message.save
            render json: @message.to_json(include: :user), status: :created, user: @message
        else
            render json: @message.errors, status: :unprocessable_entity
        end
    end

    def update
        if @message.update(message_params)
            render json: @messages.to_json(include: :user)
        else
            render json: @message.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @message.destroy
    end

    private
        def message_params
            params.require(:message).permit(:content, :topic, :user_id)
        end

        def set_message
            @message = Message.find(params[:id])
        end

end