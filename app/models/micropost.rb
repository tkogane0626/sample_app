class Micropost < ApplicationRecord

  # 関連付け
  belongs_to :user

  # 指定のモデルとアップロードされたファイルを関連付け
  has_one_attached :image

  # default_scope
  default_scope -> { order(created_at: :desc) }

  # バリデーション
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size: { less_than: 5.megabytes,
                            message: "should be less than 5MB" }
  
  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

end
