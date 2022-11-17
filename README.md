## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column                | Type       | Options                            |
| --------------------- | ---------- | ---------------------------------- |
| name                  | string     | null: false                        |
| description           | text       | null: false                        |
| category_id           | integer    | null: false                        |
| sales_status_id       | integer    | null: false                        |
| fee_status_id         | integer    | null: false                        |
| prefecture_id         | integer    | null: false                        |
| scheduled_delivery_id | integer    | null: false                        |
| price                 | string     | null: false                        |
| user                  | references | null: false, foreign_key: true     |


### Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| user               | references | null: false, foreign_key: true     |
| item               | references | null: false, foreign_key: true     |


## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- | 
| postal_code        | string     | null: false                        |
| prefecture_id      | integer    | null: false                        |
| city               | string     | null: false                        |
| addresses          | string     | null: false                        |
| building           | string     |                                    |
| phone_number       | string     | null: false                        |
| purchase           | references | null: false, foreign_key: true     |


### Association
- belongs_to :purchase