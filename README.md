# README

# テーブル設計


## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| first_name     | string | null: false |
| family_name    | string | null: false |
| first_kana     | string | null: false |
| family_kana    | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| name            | string      | null: false                    |
| description     | text        | null: false                    |
| status          | integer     | null: false                    |
| shipping_time   | integer     | null: false                    |
| delivery_charge | integer     | null: false                    |
| category        | integer     | null: false                    |
| sending_area    | integer     | null: false                    |
| price           | integer     | null: false                    |
| image           | string      | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



##  ordersテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


##  shipping_addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| address          | string     | null: false                    |
| house_number     | string     | null: false                    |
| house_name       | string     |                                |
| prefecture       | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
