require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # ! Needs to test:
  # index, create, show, total_points, points_balance
  puts "TESTING USER CONTROLLER..."
  setup :setup_users

  test "users index" do
    get "/users"
    assert_response :success
  end

  test "users show" do
    get "/users/#{@phil.id}"
    assert_response :success
  end

  test "users create" do
    post "/users", params: { name: "chad" }
    # p body
    assert_response :success
    # p JSON.parse(body)["name"]
    assert JSON.parse(body)["name"] == "chad"
  end

  test "users don't create" do
    post "/users", params: {}
    assert_response 422, status
  end

  test "get users point balance" do
    get "/users/#{@phil.id}/points_balance"
    assert_response :success
    assert JSON.parse(body) == { "CAPTAIN" => 5000, "STOKER" => 1000, "STARBUCKS" => 7500 }
  end

  test "get users total points" do
    get "/users/#{@phil.id}/total_points"
    assert_response :success
    assert JSON.parse(body)["points"] == 13500
  end

end
