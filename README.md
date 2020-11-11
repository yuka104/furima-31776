# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| family_name         | string  | null: false               |
| first_name          | string  | null: false               |
| family_name_kana    | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birthday            | integer | null: false               |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| description        | text       | null: false       |
| condition          | string     | null: false       |
| user               | references | foreign_key: true |
| price              | integer    | null: false       |
| area               | string     | null: false       |
| delivery_days      | integer    | null: false       |
| fee                | integer    | null: false       |

### Association

- has_one :purchases
- belongs_to :user


## purchases テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| product           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

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

