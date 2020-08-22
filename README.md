# README

# テーブル設計


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :profiles
- has_many :order_items


## profiles テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| first_name     | string  | null: false |
| family_name    | string  | null: false |
| first_kana     | string  | null: false |
| family_kana    | string  | null: false |
| birthday       | integer | null: false |

### Association

- belongs_to :user


## items テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| item_name   | string   | null: false |
| item_desc   | text     | null: false |
| price        | integer  | null: false |
| user         | integer  | null: false |

### Association

- has_many :status
- has_many :shipping_days
- has_many :category
- has_many :images
- has_many :delivery_charge
- has_many :sender
- belongs_to :user


##  statusテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user     | integer    | null: false |
| status   | integer    | null: false |

### Association

- belongs_to :user


##  shipping_daysテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | integer    | null: false |
| shipping_day    | integer    | null: false |

### Association

- belongs_to :user


##  categoryテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | integer    | null: false |
| category        | integer    | null: false |

### Association

- belongs_to :user


##  imagesテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | integer    | null: false |
| image           | string     | null: false |

### Association

- belongs_to :user


##  delivery_changeテーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| user              | integer    | null: false |
| delivery_change   | integer    | null: false |

### Association

- belongs_to :user


##  senderテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | integer    | null: false |
| sender          | integer    | null: false |

### Association

- belongs_to :user


##  order_itemsテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | integer    | null: false |
| order_item       | integer    | null: false |

### Association

- belongs_to :user


##  shipping_addressテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | integer    | null: false |
| address          | text       | null: false |
| house_number     | integer    | null: false |
| house_name       | integer    |             |
| postal_code      | integer    | null: false |
| order_item       | integer    | null: false |

### Association

- belongs_to :order_items


##  prefectureテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| prefecture       | integer | null: false |
| order_item       | integer | null: false |

### Association

- belongs_to :order_items
