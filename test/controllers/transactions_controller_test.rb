require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transactions_index_url
    assert_response :success
  end

  test "should get show" do
    get transactions_show_url
    assert_response :success
  end
end
