# テーブル設計

## usersテーブル

| Column         | Type           | Options     |
| -------------- | -------------- | ----------- |
| nick_name      | string         | null: false |
| email          | string         | null: false |
| password       | string         | null: false |
| user_name      | string         | null: false |
| pronunciation  | string         | null: false |
| birthday       | string         | null: false |

### Association

- has_many :items
- has_many :buyings
- has_one :address


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
- belongs_to :buying

## addressesテーブル

| Column        | Type            | Options                        |
| ------------- | --------------- | ------------------------------ |
| postcode      | string          | null: false, foreign_key: true |
| status        | string          | null: false, foreign_key: true |
| city          | string          | null: false, foreign_key: true |
| lot_number    | string          | null: false, foreign_key: true |
| building      | string          | foreign_key: true              |
| phone_number  | string          | null: false, foreign_key: true |
| user          | reference       | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :buying

## buyingsテーブル

| Column         | Type           | Options                        |
| -------------- | -------------- | ------------------------------ |
| user           | reference      | null: false, foreign_key: true |
| item           | reference      | null: false, foreign_key: true |
| address        | reference      | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address