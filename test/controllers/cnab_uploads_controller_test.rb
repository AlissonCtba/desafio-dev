require "test_helper"

class CnabUploadsControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper # Permite testar jobs no Rails

  setup do
    @cnab_upload = cnab_uploads(:one)
    @file = fixture_file_upload("CNAB.txt", "text/plain")
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
      post cnab_uploads_url, params: { cnab_upload: { file_name: "Teste", file: @file } }
    end

    assert_redirected_to cnab_upload_url(CnabUpload.last)

    temp_files = Dir.glob(Rails.root.join("tmp/uploads/*"))
    assert_not_empty temp_files, "O arquivo temporário não foi criado"

    assert_enqueued_with(job: ImportCnabJob) do
      post cnab_uploads_url, params: { cnab_upload: { file_name: "Teste", file: @file } }
    end

    # Simular o processamento do job
    perform_enqueued_jobs

    assert_equal 42, CnabEntry.where(cnab_upload_id: CnabUpload.last.id).size, "Alguns registros não foram importados"
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
