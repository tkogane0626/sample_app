require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # setup
  def setup
    @user = User.new(name: "Example User",
                     email: "user@example.com",
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  # 有効なUserかどうかをテストする
  test "should be valid" do
    assert @user.valid?
  end

  # name属性のバリデーションに対するテスト
  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  # email属性の検証に対するテスト
  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  # name属性の長さの検証に対するテスト
  test "name should not bee too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # email属性の長さの検証に対するテスト
  test "email should not bee too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # 有効なメールフォーマットを検証する
  test "email validation should accept valid address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 重複するメールアドレスの検証に対するテスト
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  # パスワード属性の空文字の検証に対するテスト
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  # パスワード属性の文字数の検証に対するテスト
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  # ダイジェストが存在しない場合のauthenticated?のテスト
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

  # dependent: :destroyのテスト
  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end
