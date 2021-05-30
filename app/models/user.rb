class User < ApplicationRecord

  # コールバック
  before_save { self.email = email.downcase }

  # email属性の正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # name属性のバリデーション
  validates :name, presence: true, length: { maximum: 50 }

  # email属性のバリデーション
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }

  # password属性のバリデーション
  validates :password, presence: true, length: { minimum: 6 }

  # セキュアパスワード
  has_secure_password

end
