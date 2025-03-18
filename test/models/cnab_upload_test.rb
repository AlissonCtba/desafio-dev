require "test_helper"

class CnabUploadTest < ActiveSupport::TestCase
  test "should create a cnab upload and associate with cnab entries" do
    cnab_upload = CnabUpload.create(file_name: "upload_example.txt", created_at: Time.now)

    cnab_entry_1 = CnabEntry.create(
      cnab_upload_id: cnab_upload.id,
      transaction_type_id: 1,
      date: Time.now.strftime('%Y-%m-%d'),
      value: 100.50,
      cpf: "01234567890",
      card: "8723****9987",
      time: Time.now,
      store_id: 1
    )

    cnab_entry_2 = CnabEntry.create(
      cnab_upload_id: cnab_upload.id,
      transaction_type_id: 4,
      date: Time.now.strftime('%Y-%m-%d'),
      value: 200.75,
      cpf: "09876543210",
      card: "5678****1234",
      time: Time.now,
      store_id: 2
    )

    assert_equal 2, cnab_upload.cnab_entries.count
    assert_includes cnab_upload.cnab_entries, cnab_entry_1
    assert_includes cnab_upload.cnab_entries, cnab_entry_2
  end

  test "should not create cnab upload without file name" do
    cnab_upload = CnabUpload.new
    assert_not cnab_upload.save
  end
end
