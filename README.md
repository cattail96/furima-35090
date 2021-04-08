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
| explanation       | text           | null: false, foreign_key: true |
| category_id       | string         | null: false, foreign_key: true |
| condition_id      | string         | null: false, foreign_key: true |
| delivery_fee_id   | string         | null: false, foreign_key: true |
| location_id       | string         | null: false, foreign_key: true |
| delivery_days_id  | string         | null: false, foreign_key: true |
| user              | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buying

## addressesテーブル

| Column         | Type            | Options                        |
| -------------- | --------------- | ------------------------------ |
| postcode       | string          | null: false, foreign_key: true |
| prefecture_id  | integer         | null: false, foreign_key: true |
| city           | string          | null: false, foreign_key: true |
| house_number   | string          | null: false, foreign_key: true |
| building_name  | string          | ------------------------------ |
| phone_number   | string          | null: false, foreign_key: true |
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