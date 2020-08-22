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
- has_many :order


## items テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| name            | string   | null: false |
| exhibitor       | string   | null: false |
| description     | text     | null: false |
| status          | integer  | null: false |
| shipping_day    | integer  | null: false |
| delivery_change | integer  | null: false |
| category        | integer  | null: false |
| sender          | integer  | null: false |
| price           | integer  | null: false |
| user            | integer  | null: false |
| order           | integer  | null: false |

### Association


- has_many :images
- belongs_to :order
- belongs_to :user


##  imagesテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | integer    | null: false |
| image           | string     | null: false |

### Association

- belongs_to :items


##  orderテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | integer    | null: false |
| order            | integer    | null: false |
| item             | integer    | null: false |

### Association

- belongs_to :user
- has many :items
- has many :shipping_address


##  shipping_addressテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| address          | string     | null: false |
| house_number     | integer    | null: false |
| house_name       | integer    |             |
| order_item       | integer    | null: false |
| prefecture       | integer    | null: false |

### Association

- belongs_to :order
