# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -----------------  | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| family_name        | string | null: false |
| last_name          | string | null: false |
| family_name_kana   | string | null: false |
| last_name_kana     | string | null: false |
| birthday_date      | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many:purchase
- has_many:items

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| category_id         | integer    | null: false                    |
| price               | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| shipping_charges_id | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
### Association

- belongs_to:user
- belongs_to:item
- has_one:address

## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city_name     | string  | null: false |
| block_name    | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association
- belongs_to :order