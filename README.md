
## users テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|email              |string    |null: false, unique: true        |
|encrypted_password |string    |null: false,                     |
|nickname           |string    |null: false,                     |
|family_name_zen    |string    |null: false,                     |
|first_name_zen     |string    |null: false,                     |
|family_name_kana   |string    |null: false,                     |
|first_name_kana    |string    |null: false,                     |
|birthday           |date      |null: false,                     | *誕生年月日

### association
has_many :items
has_many :orders


## items テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|item_name          |string    |null: false,                     |
|description        |text      |null: false,                     | **商品説明
|category_id        |integer   |null: false,                     |
|condition_id       |integer   |null: false,                     | **商品の状態 
|courier_fare_id    |integer   |null: false,                     | **配送料
|send_area_id       |integer   |null: false,                     | **配送エリア
|send_period_id     |integer   |null: false,                     | **配送期間
|price              |integer   |null: false,                     |
|user               |references|null: false, foreign_key: true   |  


**imageは、active_storageを使用するこを想定し、テーブルでは定義しない

### association
belongs_to :user
has_one    :order



## orders テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|item               |references|null: false, foreign_key: true   | 
|user               |references|null: false, foreign_key* true   |
### association
belongs_to :item
belongs_to :user
has_one    :address



## addresses テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|post_num           |string    |null: false,                     | **郵便番号
|preference_id      |integer   |null: false,                     | **都道府県
|city               |string    |null: false,                     | **市区町村
|house_num          |string    |null: false,                     | **番地
|house_name         |string    |null: true,                      | **建物名
|phone_num          |string    |null: false,                     | **電話番号
|order              |references|null: false, foreign_key: true   |  


### association
belongs_to  :order

