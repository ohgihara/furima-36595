# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| date_of_birth      | date   | null: false               |


### Association

- has_many :items
- has_many :items_logs



## items テーブル

| Column          | Type       | Options     |
| ------          | ---------- | ----------- |
| items_name      | string     | null: false |
| overview        | text       | null: false |
| price           | integer    | null: false |
| category_id     | integer    | null: false |
| quality_id      | integer    | null: false |
| delivery_fee_id | integer    | null: false |
| until_date_id   | integer    | null: false |
| shipment_id     | integer    | null: false |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :items_log


## items_log テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -----------                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column           | Type       | Options     |
| ----------       | ---------- | ----------- |
| postal_cord      | string     | null: false |
| prefecture       | integer    | null: false |
| municipalities   | string     | null: false |
| address          | string     | null: false |
| building name    | string     |             |
| telephone number | string     | null: false |
| item_log         | references | null: false, foreign_key: true |

### Association

- belongs_to :items log


