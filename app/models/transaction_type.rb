class TransactionType
  TYPES = [
    { id: 1, description: 'Débito', nature: 'Entrada', signal: '+' },
    { id: 2, description: 'Boleto', nature: 'Saída', signal: '-' },
    { id: 3, description: 'Financiamento', nature: 'Saída', signal: '-' },
    { id: 4, description: 'Crédito', nature: 'Entrada', signal: '+' },
    { id: 5, description: 'Recebimento Empréstimo', nature: 'Entrada', signal: '+' },
    { id: 6, description: 'Vendas', nature: 'Entrada', signal: '+' },
    { id: 7, description: 'Recebimento TED', nature: 'Entrada', signal: '+' },
    { id: 8, description: 'Recebimento DOC', nature: 'Entrada', signal: '+' },
    { id: 9, description: 'Aluguel', nature: 'Saída', signal: '-' }
  ]

  def self.description_by_id(id)
    type = TYPES.find { |t| t[:id] == id }
    type ? type[:description] : nil
  end

  def self.signal_by_id(id)
    type = TYPES.find { |t| t[:id] == id }
    type ? type[:signal] : nil
  end

  def self.ids_with_positive_signal
    TYPES.select { |t| t[:signal] == '+' }.map { |t| t[:id] }
  end

  def self.ids_with_negative_signal
    TYPES.select { |t| t[:signal] == '-' }.map { |t| t[:id] }
  end
end