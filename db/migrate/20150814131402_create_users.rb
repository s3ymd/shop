class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.date :birthday
      t.integer :gender
      t.string :postal_code
      t.text :address
      t.string :tel

      t.timestamps null: false
    end
  end
end
