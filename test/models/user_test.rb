require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", role: "manager")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "role should only be employee or manager" do
    # Test using employee role
    @user.role = "employee"
    assert @user.valid?
    # Test using manager role
    @user.role = "manager"
    assert @user.valid?
    # Test using an invalid role
    @user.role = "something"
    assert_not @user.valid?
  end
end
