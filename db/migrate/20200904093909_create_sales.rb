class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t| 
      t.string :postal_code,      null: false
      t.string :address,          null: false
      t.string :house_number,     null: false
      t.string :house_name
      t.string :telephone_number, null: false
      t.integer :prefecture,      null: false
      t.references :order,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
