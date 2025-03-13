require "test_helper"

class CnabUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cnab_upload = cnab_uploads(:one)
  end

  test "should get index" do
    get cnab_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_cnab_upload_url
    assert_response :success
  end

  test "should create cnab_upload" do
    assert_difference("CnabUpload.count") do
      post cnab_uploads_url, params: { cnab_upload: { created_at: @cnab_upload.created_at, file_name: @cnab_upload.file_name } }
    end

    assert_redirected_to cnab_upload_url(CnabUpload.last)
  end

  test "should show cnab_upload" do
    get cnab_upload_url(@cnab_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_cnab_upload_url(@cnab_upload)
    assert_response :success
  end

  test "should update cnab_upload" do
    patch cnab_upload_url(@cnab_upload), params: { cnab_upload: { created_at: @cnab_upload.created_at, file_name: @cnab_upload.file_name } }
    assert_redirected_to cnab_upload_url(@cnab_upload)
  end

  test "should destroy cnab_upload" do
    assert_difference("CnabUpload.count", -1) do
      delete cnab_upload_url(@cnab_upload)
    end

    assert_redirected_to cnab_uploads_url
  end
end
