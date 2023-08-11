
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



## items テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|item_name          |string    |null: false,                     |
|description        |text      |null: false,                     | **商品説明
|category_id        |text      |null: false,                     |
|condition_id       |text      |null: false,                     | **商品の状態 
|courier_fare_id    |string    |null: false,                     | **配送料
|send_area_id       |text      |null: false,                     | **配送エリア
|send_period_id     |text      |null: false,                     | **配送期間
|price              |integer   |null: false,                     |
|user               |references|null: false, foreign_key: true   |  


**imageは、active_storageを使用するこを想定し、テーブルでは定義しない

### association
belongs_to :user
has_one    :order



## orders テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|items              |references|null: false, foreign_key: true   | 
|address            |references|null: false, foreign_key* true   |

### association
belongs_to :item
belongs_to :address



## addresses テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|card_info          |string    |null: false,                     |
|expiration_date    |string    |null: false,                     | **有効期限
|security_code      |string    |null: false,                     | **セキュリティーコード
|send_address       |string    |null: false,                     | *着場所
|send_phonenum      |string    |null: false,                     | *電話番号
|order              |references|null: false, foreign_key: true   |  


### association
has_one    :order

