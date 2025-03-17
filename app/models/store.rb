class Store < ApplicationRecord
  has_many :cnab_entries

  def sum_outgoing_transactions
    CnabEntry.where(transaction_type_id: TransactionType.ids_with_negative_signal, store_id: self.id).sum(:value)
  end

  def sum_incoming_transactions
    CnabEntry.where(transaction_type_id: TransactionType.ids_with_positive_signal, store_id: self.id).sum(:value)
  end
end
