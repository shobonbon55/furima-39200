
## users テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|email              |string    |null: false, UNIQUE              |
|encrypted_password |string    |null: false,                     |
|name               |string    |null: false,                     |
|


### association
has_many :items


## items テーブル##

|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|item name          |text      |null: false,                     |
|price              |string    |null: false,                     |
|courier fare       |string    |null: false,                     | **配送料
|Description        |text      |null: false,                     | **商品説明
|Seller             |text      |null: false,                     | **出品者
|category           |text      |null: false,                     |
|quantity           |string    ||null: false,                    | **購入数量
|user               |reference |null: false, foreign_key: true   |  

**imageは、active_storageを使用するこを想定し、テーブルでは定義しない

### association
belongs_to :users
has_many   :buyers


## buyers テーブル##
|Column             |type      |Option                           |
|-------------------|----------|---------------------------------|
|buyer name         |text      |null: false,                     |
|send-address       |text      |null: false,                     |
|send-phonenum      |string    |null: false,                     |
|items              |reference |null: false, foreign_key: true   |  


### association
belongs_to :items