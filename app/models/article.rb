class Article < ApplicationRecord
     extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :courier_fare
    belongs_to :send_area
    belongs_to :send_period
    
    validates :title, :text, presence: true

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :courier_fare_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :send_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :send_period_id, numericality: { other_than: 1 , message: "can't be blank"}

end
