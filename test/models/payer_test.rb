require "test_helper"

class PayerTest < ActiveSupport::TestCase
  puts "TESTING PAYERS..."
  setup :setup_payers

  test "payer created successfully" do
    payer = Payer.new(name: "COUNTERPOINT")
    assert payer.save
  end

  test "payer needs a name" do
    assert_not payers(:bad_1).save
  end

  test "has a payer" do
    assert @captain
  end

  test "payer has many transactions" do
    # debugger
    assert @captain.transactions.class.to_s == "Transaction::ActiveRecord_Associations_CollectionProxy"
  end
  
  test "payer has many users through transactions" do
    assert @captain.users.class.to_s == "User::ActiveRecord_Associations_CollectionProxy"
  end

end
