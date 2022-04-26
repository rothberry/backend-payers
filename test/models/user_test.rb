require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  puts "TESTING USERS..."
  test "user created successfully" do
    user = User.new(name: "Phil")
    assert user.save
  end

  test "second" do
    puts "second"
  end

  test "TESTING" do 
    puts "third"
    p User.all
    debugger
  end

end
