# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :transactions 

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | string     | null: false                    |
| category           | string     | null: false                    |
| sales_status       | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| prefecture         | string     | null: false                    |
| scheduled_delivery | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction

## transactions テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | integer    | null: false                    |
| card_exp_month | integer    | null: false                    |
| card_exp_year  | integer    | null: false                    |
| card_cvc       | integer    | null: false                    |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: ture |

### Association

-belongs_to :user
-belongs_to :item