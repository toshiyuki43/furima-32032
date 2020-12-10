# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| -----------------  | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false, unique:true |
| family_name        | string | null: false              |
| last_name          | string | null: false              |
| family_name_kana   | string | null: false              |
| last_name_kana     | string | null: false              |
| date               | string | null: false              |
| encrypted_password | string | null: false              |

### Association

- has_many:purchases
- has_many:items

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
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

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city_name     | references  | null: false, foreign_key: true |
| block_name    | references  | null: false, foreign_key: true |
| building_name | references  | null: false, foreign_key: true |
| phone_number  | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase