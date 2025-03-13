class CreateCnabUploads < ActiveRecord::Migration[7.1]
  def up
    create_table :cnab_uploads do |t|
      t.string :file_name

      t.timestamps
      t.datetime :deleted_at
    end unless table_exists?(:cnab_uploads)
  end

  def down
    drop_table :cnab_uploads if table_exists?(:cnab_uploads)
  end
end
