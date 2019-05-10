require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "BOB", email: "Bob@gmail.com")
  end

  test "User valid" do
    assert @user.valid?
  end

  test "refutes invalid emails" do
    test_emails = %w[hellospank www.fafa.w mamma@mia]
    test_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end

  test "accepts valid email" do 
    test_emails = %w[a@aa.it a-a.a@bel.lo.it mamma@mia.com]
    test_emails.each do |email|
      @user.email = email
      assert @user.valid?
    end
  end

  test "Only takes one email at time" do
    user_2 = User.new(name: "User2", email: @user.email)
    @user.save
    assert_not user_2.valid?
  end
end
