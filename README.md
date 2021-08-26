# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| e-mail             | string | null: false |
| encrypted_password | string | null: false |
| date_of_birth      | text   | null: false |


### Association

- has_many :items
- has_many :items_log



## items テーブル

| Column       | Type       | Options     |
| ------       | ---------- | ----------- |
| items_name   | text       | null: false |
| image        | references | null: false |
| overview     | references | null: false |
| category     | text       | null: false |
| quality      | references | null: false |
| delivery_fee | references | null: false |
| quality      | references | null: false |
| delivery_fee | references | null: false |


### Association

- belongs_to :user
- belongs_to :prototypes



## items_log テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
|            |            |             |

### Association

- belongs_to :users
- belongs_to :items
- has_one :adress



## adress テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| adress     |            | null: false |

### Association

- has_many :comments
- belongs_to :user