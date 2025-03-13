class CnabUpload < ApplicationRecord
  has_many :cnab_entries

  def process_cnab_file(file)
    file_content = file.read

    file_content.each_line do |line|
      # Extrai os dados de cada linha com base nas posições definidas
      transaction_type_id = line[0, 1]        # Tipo da transação
      date = line[1, 8]                       # Data da ocorrência
      value = line[9, 10].to_i / 100.0        # Valor da movimentação (divido por 100 para normalizar)
      cpf = line[19, 11]                      # CPF do beneficiário
      card = line[30, 12]                     # Cartão utilizado
      hour = line[42, 6]                      # Hora da ocorrência
      store_owner = line[48, 14].strip        # Dono da loja (nome do representante)
      store_name = line[62, 19].strip         # Nome da loja

      CnabEntry.create!(
        cnab_upload_id: self.id,
        transaction_type_id: transaction_type_id.to_i, 
        date: Date.parse(date),
        value: value,
        cpf: cpf.strip,
        card: card.strip,
        time: hour.strip,
        store_owner: store_owner,
        store_name: store_name
      )
    end
  end
end
