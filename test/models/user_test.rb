require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  puts "TESTING USERS..."
  setup :setup_users
  # teardown :remove_users

  test "user created successfully" do
    user = User.new(name: "Phil")
    assert user.save
  end

  test "user needs a name" do
    assert_not users(:bad_1).save
  end

  test "has a user" do
    # p @phil
    assert @phil
  end

  test "user has many transactions" do
    # debugger
    assert @phil.class == Transaction::ActiveRecord_Associations_CollectionProxy
  end
  
  private 
  
  def setup_users
    @phil = users(:phil)
    @jill = users(:jill)
  end

  def remove_users
    @phil = nil
    @jill = nil
  end

end
