class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :payment_method
      t.string :postal_code
      t.text :address
      t.string :name
      t.string :tel

      t.timestamps null: false
    end
  end
end
