## usersテーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| email              | string | null: false, UNIQUE |
| encrypted_password | string | null: false         |
| nickname           | string | null: false         |
| last_name          | string | null: false         |
| first_name         | string | null: false         |
| last_name_kana     | string | null: false         |
| first_name_kana    | string | null: false         |
| birth_year         | string | null: false         |
| birth_month        | string | null: false         |
| birth_day          | string | null: false         |

### Association

- has_many :items
- has_many :cards
- has_many :adresses


## itemsテーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| name               | string     | null: false                        |
| image              | string     | null: false                        |
| discription        | string     | null: false                        |
| category           | string     | null: false                        |
| sales_status       | string     | null: false                        |
| fee_status         | string     | null: false                        |
| prefecture         | string     | null: false                        |
| scheduled_delivery | string     | null: false                        |
| price              | string     | null: false                        |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## cardsテーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| number             | string     | null: false                        |
| exp_month          | string     | null: false                        |
| exp_year           | string     | null: false                        |
| cvc                | string     | null: false                        |
| user_id            | references | null: false, foreign_key: true     |


## Association

- belongs_to :user
- has_one :adress

## adressesテーブル

| Column             | Type       | Options                            |
| ------------------ | ------     | ---------------------------------- | 
| postal_code        | string     | null: false                        |
| prefecture         | string     | null: false                        |
| city               | string     | null: false                        |
| adresses           | string     | null: false                        |
| building           | string     |                                    |
| phone_number       | string     | null: false                        |
| user_id            | references | null: false, foreign_key: true     |


### Association

- belongs_to :user 
- belongs_to :card