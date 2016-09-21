class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update,:destroy]
  
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
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      redirect_to root_path, notice: "成功しました！"  
    else
      flash.now "失敗しました"
      render "edit"
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: "メッセージを削除しました"
  end
  
  private
    # 保存系でPOSTした内容を元にする場合は項目を制御する
    def message_params
      params.require(:message).permit(:name, :body)
    end
    
    def set_message
      @message = Message.find(params[:id])
    end
end
