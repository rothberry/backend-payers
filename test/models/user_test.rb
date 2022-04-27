require "test_helper"

class UserTest < ActiveSupport::TestCase

  puts "TESTING USERS..."
  setup :setup_users

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
    assert @phil.transactions.class.to_s == "Transaction::ActiveRecord_Associations_CollectionProxy"
  end
  
  test "user has many payers through transactions" do
    assert @phil.payers.class.to_s == "Payer::ActiveRecord_Associations_CollectionProxy"
  end

end
