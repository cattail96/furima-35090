# テーブル設計

## usersテーブル

| Column              | Type           | Options                    |
| ------------------- | -------------- | -------------------------- |
| nick_name           | string         | null: false                |
| email               | string         | null: false, unique: true  |
| encrypyed_password  | string         | null: false                |
| family_name         | string         | null: false                |
| first_name          | string         | null: false                |
| last_name_kana      | string         | null: false                |
| first_name_kana     | string         | null: false                |
| birthday            | date           | null: false                |

### Association

- has_many :items
- has_many :buyings

## itemsテーブル

| Column            | Type           | Options                        |
| ----------------- | -------------- | ------------------------------ |
| item_name         | string         | null: false                    |
| price             | integer        | null: false                    |
| item_explanation  | text           | null: false                    |
| category_id       | integer        | null: false                    |
| condition_id      | integer        | null: false                    |
| delivery_fee_id   | integer        | null: false                    |
| prefecture_id     | integer        | null: false                    |
| delivery_days_id  | integer        | null: false                    |
| user              | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buying

## addressesテーブル

| Column         | Type            | Options                        |
| -------------- | --------------- | ------------------------------ |
| postcode       | string          | null: false                    |
| prefecture_id  | integer         | null: false                    |
| city           | string          | null: false                    |
| house_number   | string          | null: false                    |
| building_name  | string          | --                             |
| phone_number   | string          | null: false                    |
| buying         | reference       | null: false, foreign_key: true |

### Association

- belongs_to :buying

## buyingsテーブル

| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| user           | reference      | null: false, foreign_key: true |
| item           | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address