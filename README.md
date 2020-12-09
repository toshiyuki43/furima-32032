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
| birthday_year      | string | null: false |
| birthday_month     | string | null: false |
| birthday_day       | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many:purchases
- has_many:items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category         | string     | null: false                    |
| price            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| shipping_charges | string     | null: false                    |
| condition        | string     | null: false                    |
| prefecture       | string     | null: false                    |
| shipping_day     | string     | null: false                    |

### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| last_name        | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| credit_card      | references | null: false, foreign_key: true |
### Association

- belongs_to:user
- belongs_to:item