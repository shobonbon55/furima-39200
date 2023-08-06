
## users テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|email              |string    |null: false, unique: true        |
|encrypted_password |string    |null: false,                     |
|nickname           |string    |null: false,                     |
|family_name  zen   |string    |null: false,                     |
|first_name   zen   |string    |null: false,                     |
|family_name  kana  |string    |null: false,                     |
|first_name   kana  |string    |null: false,                     |
|birth_year         |integer   |null: false,                     | *誕生年
|birth_month        |integer   |null: false,                     | *誕生月
|birth_day          |integer   |null: false,                     | *誕生日

### association
has_many :items


## items テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|item_name          |text      |null: false,                     |
|description        |text      |null: false,                     | **商品説明
|category           |text      |null: false,                     |
|condition          |text      |null: false,                     | **商品の状態 
|courier_fare       |string    |null: false,                     | **配送料
|send_area          |text      |null: false,                     | **配送エリア
|send_period        |text      |null: false,                     | **配送期間
|price              |integer   |null: false,                     |
|user               |reference |null: false, foreign_key: true   |  


**imageは、active_storageを使用するこを想定し、テーブルでは定義しない

### association
belongs_to :user
has_many   :orders


## orders テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|buyer_name         |text      |null: false,                     |
|items              |reference |null: false, foreign_key: true   |  



### association
belongs_to :item
has_one    :address


## address テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|send_address       |text      |null: false,                     | *着場所
|send_phonenum      |integer   |null: false,                     | *電話番号
|payment            |text      |null: false,                     | *決済手段
|arrival_day        |integer   |null: false,                     | *着日
|orders             |reference |null: false, foreign_key: true   |  


### association
belongs_to :order

