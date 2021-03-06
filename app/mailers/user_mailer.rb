class UserMailer < ApplicationMailer

  # アカウント有効化のリンクをメール送信する
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # パスワード再設定のリンクをメール送信する
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

end
