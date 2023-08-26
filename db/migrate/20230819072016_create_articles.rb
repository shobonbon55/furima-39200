class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,            null: false
      t.text       :text,             null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :courier_fare_id,  null: false     
      t.integer    :send_area_id,     null: false
      t.integer    :send_period_id,   null: false



      t.timestamps
    end
  end
end

