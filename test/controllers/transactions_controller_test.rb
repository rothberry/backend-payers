require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest

  # !needs index, show, spend_points, add_transaction
  setup do
    setup_transactions
    setup_users
    setup_payers
  end

  test "transactions index" do
    get "/transactions"
    assert_response :success
  end

  test "transactions show" do
    get "/transactions/#{@t_1.id}"
    assert_response :success
  end

  test "add transaction route new payer" do
    post "/add_transaction", params: { user_id: @phil.id, payer: "DANNON", points: 5000, timestamp: "2022-04-27 19:40:15.769867 UTC" }
    # pp JSON.parse(body)
    assert_response :success
    assert JSON.parse(body)["payer"]["name"] == "DANNON"
  end

  test "add transaction route existing payer" do
    post "/add_transaction", params: { user_id: @phil.id, payer: @captain.name, points: 5000, timestamp: "2022-04-27 19:40:15.769867 UTC" }
    # pp JSON.parse(body)
    assert_response :success
    assert JSON.parse(body)["payer"]["id"] == @captain.id
  end

  test "can spend points" do
    spending_points = 10000
    starting_total_points = @phil.total_points
    post "/spend_points", params: { user_id: @phil.id, points: spending_points }
    # pp JSON.parse(body)
    ending_total_points = @phil.total_points
    assert_response :success
    assert starting_total_points - ending_total_points == spending_points
    assert JSON.parse(body) == [{ "payer" => "CAPTAIN", "points" => -5000 }, { "payer" => "STOKER", "points" => -1000 }, { "payer" => "STARBUCKS", "points" => -4000 }]
  end

  test "cannot spend points if user doesnt have enough" do
    spending_points = 20000
    starting_total_points = @phil.total_points
    post "/spend_points", params: { user_id: @phil.id, points: spending_points }
    # pp JSON.parse(body)
    ending_total_points = @phil.total_points
    assert_response 422, status
    assert starting_total_points == ending_total_points
    assert JSON.parse(body)["error"]
  end
end
