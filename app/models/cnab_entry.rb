class CnabEntry < ApplicationRecord
  # Validação para garantir que o tipo de transação esteja correto
  validates :transaction_type_id, inclusion: { in: TransactionType::TYPES.map { |type| type[:id] } }

  belongs_to :store
  belongs_to :cnab_upload

  # Usando o tipo de transação para mostrar a descrição
  def transaction_type_description
    TransactionType.description_by_id(self.transaction_type_id)
  end

  def transaction_type_signal
    TransactionType.signal_by_id(self.transaction_type_id)
  end
end
