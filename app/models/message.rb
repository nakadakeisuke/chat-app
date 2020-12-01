class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  #　Messagesテーブルに画像ファイルを紐付け

  validates :content, presence: true, unless: :was_attached?
  #　content カラムに、presence:trueを設けることで、空の場合はDBに保存しないというバリデーションを設定している
  #　validatesのunlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作成
  def was_attached?
    self.image.attached?
  end

end
