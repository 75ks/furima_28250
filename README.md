# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :favorites
- has_many :comments
- has_one  :profile
- has_one  :credit_cards
- has_one  :addresses

## profiles テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birth_year       | date       | null: false                    |
| birth_month      | date       | null: false                    |
| birth_day        | date       | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -----------                    |
| name                   | string     | null: false                    |
| image                  | string     | null: false                    |
| price                  | integer    | null: false                    |
| introduction           | text       | null: false                    |
| category_id            | integer    | null: false                    |
| item_condition_id      | integer    | null: false                    |
| postage_payer_id       | integer    | null: false                    |
| area_id                | integer    | null: false                    |
| preparation_days_id    | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |

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
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_mont  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer(7) | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | integer    | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
