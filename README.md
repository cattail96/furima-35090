# テーブル設計

## usersテーブル

| Column              | Type           | Options      |
| ------------------- | -------------- | ------------ |
| nick_name           | string         | null: false  |
| email               | string         | unique: true |
| encrypyed_password  | string         | null: false  |
| family_name         | string         | null: false  |
| first_name          | string         | null: false  |
| last_name_kana      | string         | null: false  |
| first_name_kana     | string         | null: false  |
| birthday            | date           | null: false  |

### Association

- has_many :items
- has_many :buyings

## itemsテーブル

| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| item_name      | string         | null: false, foreign_key: true |
| image          | ActiveStorage  | null: false, foreign_key: true |
| price          | string         | null: false, foreign_key: true |
| explanation    | text           | null: false, foreign_key: true |
| category       | string         | null: false, foreign_key: true |
| condition      | string         | null: false, foreign_key: true |
| delivery_fee   | string         | null: false, foreign_key: true |
| location       | string         | null: false, foreign_key: true |
| delivery_days  | string         | null: false, foreign_key: true |
| user           | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buying

## addressesテーブル

| Column        | Type            | Options                        |
| ------------- | --------------- | ------------------------------ |
| postcode      | string          | null: false, foreign_key: true |
| prefecture    | integer         | null: false, foreign_key: true |
| city          | string          | null: false, foreign_key: true |
| house_number  | string          | null: false, foreign_key: true |
| building_name | string          | foreign_key: true              |
| phone_number  | integer         | null: false, foreign_key: true |
| item          | reference       | null: false, foreign_key: true |

### Association

- belongs_to :buying

## buyingsテーブル

| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| user           | reference      | null: false, foreign_key: true |
| item           | reference      | null: false, foreign_key: true |
| address        | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address