require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  # 新しいMicropostの有効性に対するテスト
  test "should be valid" do
    assert @micropost.valid?
  end

  # ユーザーidが存在しないMicropostの有効性に対するテスト
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  # content属性の存在性に対するテスト
  test "content should be present" do
    @micropost.content = " "
    assert_not @micropost.valid?
  end

  # content属性の文字数に対するテスト
  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  # マイクロポストの順序付けをテストする
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
