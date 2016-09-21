class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      # redirect_toは301でブラウザに別のURLへアクセスさせる
      redirect_to root_path, notice: "メッセージを保存しました"
    else
      @messages = Message.all
      # flash.nowは同じアクセスでflashを使う
      flash.now[:alert] = "メッセージの保存に失敗しました"
      # htmlを返すだけ
      render 'index'
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:name, :body)
    end
end
