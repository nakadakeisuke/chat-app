class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    #チャットルームに紐づいている全てのメッセージ（@room.messages）を@messagesと定義
    #includesメソッドを使ってN＋1問題を解消
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      #投稿に失敗した時の処理にも同様に@messagesを定義
      render :index
      #renderを使うことで、投稿に失敗した@messageの情報を保持しつつ、index.html.erbを参照することができる
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end