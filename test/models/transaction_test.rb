require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  puts "TESTING TRANSACTIONS..."
  setup :setup_transactions

  test "transaction created successfully" do
    t_test = Transaction.new(user: users(:phil), payer: payers(:captain), points: 5000, timestamp: "2022-04-27 18:28:29.232805 UTC")
    assert t_test.save
  end

  test "needs all attributes to save" do
    assert_not @bad_1.save
  end

  test "has a user" do
    assert @t_1.user.class == User
  end

  test "has a payer" do
    assert @t_1.payer.class== Payer
  end

end
