class CreateCnabEntries < ActiveRecord::Migration[6.0]
  def up
    create_table :cnab_entries do |t|
      t.integer :cnab_upload_id
      t.integer :transaction_type_id
      t.date :date
      t.float :value, precision: 10, scale: 2
      t.string :cpf, limit: 11
      t.string :card, limit: 12
      t.time :time
      t.integer :store_id
      
      t.timestamps
      t.datetime :deleted_at
    end unless table_exists?(:cnab_entries)
  end

  def down
    drop_table :cnab_entries if table_exists?(:cnab_entries)
  end
end
