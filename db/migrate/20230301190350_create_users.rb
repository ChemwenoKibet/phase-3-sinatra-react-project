class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :user_id
      t.integer :phone_number
    end  
  end
end
