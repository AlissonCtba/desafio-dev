require "application_system_test_case"

class CnabUploadsTest < ApplicationSystemTestCase
  setup do
    @cnab_upload = cnab_uploads(:one)
  end

  test "visiting the index" do
    visit cnab_uploads_url
    assert_selector "h1", text: "Cnab uploads"
  end

  test "should create cnab upload" do
    visit cnab_uploads_url
    click_on "New cnab upload"

    fill_in "Created at", with: @cnab_upload.created_at
    fill_in "File name", with: @cnab_upload.file_name
    click_on "Create Cnab upload"

    assert_text "Cnab upload was successfully created"
    click_on "Back"
  end

  test "should update Cnab upload" do
    visit cnab_upload_url(@cnab_upload)
    click_on "Edit this cnab upload", match: :first

    fill_in "Created at", with: @cnab_upload.created_at
    fill_in "File name", with: @cnab_upload.file_name
    click_on "Update Cnab upload"

    assert_text "Cnab upload was successfully updated"
    click_on "Back"
  end

  test "should destroy Cnab upload" do
    visit cnab_upload_url(@cnab_upload)
    click_on "Destroy this cnab upload", match: :first

    assert_text "Cnab upload was successfully destroyed"
  end
end
