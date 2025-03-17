require "test_helper"

class StoreTest < ActiveSupport::TestCase
  test "should have many cnab entries" do
    store = Store.create!(name: 'Loja Teste', balance: 100.0)

    cnab_entry1 = CnabEntry.create!(store: store, cnab_upload_id: 1, transaction_type_id: 1, date: Date.today, value: 100.0, cpf: '12345678901', card: '123456789012', time: '10:00:00')
    cnab_entry2 = CnabEntry.create!(store: store, cnab_upload_id: 2, transaction_type_id: 2, date: Date.today, value: 50.0, cpf: '23456789012', card: '234567890123', time: '11:00:00')

    # Verifica se a loja tem os cnab_entries associados corretamente
    assert_equal 2, store.cnab_entries.count
    assert_includes store.cnab_entries, cnab_entry1
    assert_includes store.cnab_entries, cnab_entry2
  end
end
