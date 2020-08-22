# README

# テーブル設計


## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
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
| shipping_day    | integer     | null: false                    |
| delivery_change | integer     | null: false                    |
| category        | integer     | null: false                    |
| sender          | integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association

- has_many :images
- belongs_to :user
- has_one :order


##  imagesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| items           | references | null: false, foreign_key: true |
| image           | string     | null: false                    |

### Association

- belongs_to :items


##  orderテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has many :shipping_address


##  shipping_addressテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| address          | string     | null: false                    |
| house_number     | integer    | null: false                    |
| house_name       | string     |                                |
| prefecture       | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
