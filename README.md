# テーブル設計

## users テーブル

| Column      | Type    | Options                   |
| ----------- | ------- | ------------------------- |
| nickname    | string  | null: false               |
| email       | string  | null: false, unique: true |
| password    | string  | null: false               |
| first_name  | string  | null: false               |
| last_name   | string  | null: false               |
| f_name_kana | string  | null: false               |
| l_name_kana | string  | null: false               |
| birth_y     | integer | null: false               |
| birth_m     | integer | null: false               |
| birth_d     | integer | null: false               |

### Association

- has_many :cards
- has_many :items
- has_many :ordered-items

## cards テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| card_num   | integer    | null: false                    |
| card_exp_m | integer    | null: false                    |
| card_exp_y | integer    | null: false                    |
| cvc        | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | text       | null: false                    |
| i_name                 | string     | null: false                    |
| i_explanation          | string     | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_charge_id     | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ordered-item

## ordered_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping_address

## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | integer    | null: false                    |
| addresses    | integer    | null: false                    |
| building     | integer    |                                |
| phone_num    | integer    | null: false                    |
| ordered_item | references | null: false, foreign_key: true |

### Association

- belongs_to :ordered-item