class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  #Messagesテーブルに画像ファイルを紐付け

  validates :content, presence: true
  #　content カラムに、presence:trueを設けることで、空の場合はDBに保存しないというバリデーションを設定している
end
