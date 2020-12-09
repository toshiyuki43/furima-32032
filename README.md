# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birthday_year    | string | null: false |
| birthday_month   | string | null: false |
| birthday_day     | string | null: false |

### Association

- has_many :items
- belongs_to :addresses

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| category | string     | null: false                    |
| price    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## credit_card テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| year            | string     | null: false                    |
| month           | string     | null: false                    |
| security_number | string     | null: false                    |

### Association

- belongs_to :purchase
- belongs_to :user

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| last_name        | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| credit_card      | references | null: false, foreign_key: true |
### Association

- has_many:credit_cards
- belongs_to:user
- belongs_to:item