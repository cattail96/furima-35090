# テーブル設計

## usersテーブル

| Column              | Type           | Options                    |
| ------------------- | -------------- | -------------------------- |
| nick_name           | string         | null: false                |
| email               | string         | null: false, unique: true  |
| encrypted_password  | string         | null: false                |
| family_name         | string         | null: false                |
| first_name          | string         | null: false                |
| family_name_kana      | string         | null: false                |
| first_name_kana     | string         | null: false                |
| birthday            | date           | null: false                |

### Association

- has_many :items
- has_many :orders

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
| tag               | reference      | null: false, foreign_key: true |
| item_tag_relations| reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :tags
- has_many :item_tag_relations

## addressesテーブル

| Column         | Type            | Options                        |
| -------------- | --------------- | ------------------------------ |
| postal_code    | string          | null: false                    |
| prefecture_id  | integer         | null: false                    |
| city           | string          | null: false                    |
| house_number   | string          | null: false                    |
| building_name  | string          | --                             |
| phone_number   | string          | null: false                    |
| order_id       | reference       | null: false, foreign_key: true |

### Association

- belongs_to :order

## ordersテーブル

| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| user           | reference      | null: false, foreign_key: true |
| item           | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## tagsテーブル

| Column             | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| item_tag_relations | reference      | null: false, foreign_key: true |
| item               | reference      | null: false, foreign_key: true |

### Association

- has_many :item_tag_relations
- has_many :item

## ItemTagRelationsテーブル

| Column             | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| item               | reference      | null: false, foreign_key: true |
| tag                | reference      | null: false, foreign_key: true |

### Association

 - belongs_to :item
 - belongs_to :tag