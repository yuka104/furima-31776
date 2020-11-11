# テーブル設計

## users テーブル

| Column            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| nickname          | string  | null: false               |
| email             | string  | null: false, unique: true |
| password          | string  | null: false               |
| family_name       | string  | null: false               |
| first_name        | string  | null: false               |
| family_name_kana  | string  | null: false               |
| first_name_kana   | string  | null: false               |
| date_of_birth     | integer | null: false                |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| product_name       | string     | null: false       |
| description        | text       | null: false       |
| product_condition  | string     | null: false       |
| user               | references | foreign_key: true |
| price              | integer    | null: false       |
| ship_from_area     | string     | null: false       |
| delivery_days      | integer    | null: false       |
| delivery_fee       | integer    | null: false       |

### Association

- has_many :purchases
- belongs_to :user


## purchases テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| product_name      | references | foreign_key: true |
| purchase_date     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## addresses テーブル

| Column        | Type     | Options     |
| ------------- | -------  | ----------- |
| postal_code   | integer  | null: false |
| state         | string   | null: false |
| city          | string   | null: false |
| brock_number  | integer  | null: false |
| building      | string   | null: false |
| phone_number  | integer  | null: false |

### Association

- belongs_to :purchase

