class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_num,        null:false
      t.integer    :preference_id,   null:false
      t.string     :city,            null:false
      t.string     :house_num,       null:false
      t.string     :house_name,      null:true
      t.string     :phone_num,       null:false
      t.references :order,           null: false, foreign_key: true 
      t.timestamps
    end
  end
end
