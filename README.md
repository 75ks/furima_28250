# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday         | date       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :favorites
- has_many :comments
- has_one  :addresses

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -----------                    |
| name                   | string     | null: false                    |
| image                  | string     | null: false                    |
| price                  | integer    | null: false                    |
| introduction           | text       | null: false                    |
| category               | references | null: false, foreign_key: true |
| item_condition         | references | null: false, foreign_key: true |
| postage_payer          | references | null: false, foreign_key: true |
| area                   | references | null: false, foreign_key: true |
| preparation_day        | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |

### Association

- has_many               :favorites
- has_many               :comments
- belongs_to             :user
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :area
- belongs_to_active_hash :preparation_day

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer(7) | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | integer    | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
