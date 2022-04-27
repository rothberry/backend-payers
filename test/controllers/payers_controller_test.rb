require "test_helper"

class PayersControllerTest < ActionDispatch::IntegrationTest

  # ! needs to test index, show, create
  setup :setup_payers

  test "payers index" do
    get "/payers"
    assert_response :success
  end

  test "payers show" do
    get "/payers/#{@captain.id}"
    assert_response :success
    assert JSON.parse(body)["name"] == "CAPTAIN"
  end

  test "payers create" do
    post "/payers", params: { name: "CHAMPION" }
    assert_response :success
    assert JSON.parse(body)["name"] == "CHAMPION"
  end

  test "payers don't create" do
    post "/payers", params: {}
    assert_response 422, status
  end
  
end
