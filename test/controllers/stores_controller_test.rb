require "test_helper"

class StoresControllerTest < ActionDispatch::IntegrationTest

  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get stores_url
    assert_response :success
  end

  test "should show cnab_upload" do
    get stores_url(@store)
    assert_response :success
  end
end
