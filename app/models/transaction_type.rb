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
end