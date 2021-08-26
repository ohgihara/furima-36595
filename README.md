# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| date_of_birth      | date   | null: false               |


### Association

- has_many :items
- has_many :items_log



## items テーブル

| Column       | Type       | Options     |
| ------       | ---------- | ----------- |
| items_name   | string     | null: false |
| overview     | references | null: false |
| category     | text       | null: false |
| quality      | references | null: false |
| delivery_fee | references | null: false |
| quality      | references | null: false |



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



## address テーブル

| Column           | Type       | Options     |
| ----------       | ---------- | ----------- |
| postal_cord      | string     | null: false |
| prefectures      | string     | null: false |
| municipalities   | string     | null: false |
| address          | integer    | null: false |
| Building name    | string     | null: false |
| telephone number | integer    | null: false |

