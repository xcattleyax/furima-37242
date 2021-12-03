# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

### Association

- has_many :items
- has_many :transactions 

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category           | string     | null: false                    |
| sales_status       | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| prefecture         | string     | null: false                    |
| scheduled_delivery | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :item
-has_one :transaction

## transactions テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

-belongs_to :order
