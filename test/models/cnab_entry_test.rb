require "test_helper"

class CnabEntryTest < ActiveSupport::TestCase
  test "should not save cnab entry with invalid transaction type id" do
    invalid_transaction_type_id = 99999 # ID inválido para simulação

    cnab_entry = CnabEntry.new(
      cnab_upload_id: 1,
      transaction_type_id: invalid_transaction_type_id,
      date: Time.now.strftime('%Y-%m-%d'),
      value: 100.50,
      cpf: "01234567890",
      card: "8723****9987",
      time: Time.now,
      store: stores(:one)
    )
    
    assert_not cnab_entry.save, "CnabEntry com ID inválido foi salvo"
  end

  test "should belong to store and cnab_upload" do
    cnab_entry = cnab_entries(:one)
    assert cnab_entry.store.present?, "CnabEntry is not associated with a store"
    assert cnab_entry.cnab_upload.present?, "CnabEntry is not associated with a cnab_upload"
  end

  test "should return correct transaction type description" do
    cnab_entry = cnab_entries(:one)
    description = cnab_entry.transaction_type_description
    expected_description = TransactionType.description_by_id(cnab_entry.transaction_type_id)

    assert_equal expected_description, description, "Transaction type description is incorrect"
  end
end

