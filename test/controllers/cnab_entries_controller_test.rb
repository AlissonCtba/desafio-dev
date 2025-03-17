require "test_helper"

class CnabEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "should get index" do
    get cnab_entries_url
    assert_response :success
  end
end
