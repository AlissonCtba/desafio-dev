class CreateStores < ActiveRecord::Migration[7.1]
  def up
    create_table :stores do |t|
      t.string :name
      t.string :owner
      t.decimal :balance

      t.timestamps
      t.datetime :deleted_at
    end unless table_exists?(:stores)
  end

  def down
    drop_table :stores if table_exists?(:stores)
  end
end
