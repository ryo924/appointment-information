# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------             | ----   | -------     |
| first_name         | string | null: false |
| last_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| occupation         | string | null: false |

### Association

- has_many :schedules
- has_many :comments

## schedules テーブル

| Column          | Type       | Options                        |
| ------          | ----       | -------                        |
| title           | string     | null: false                    |
| company         | string     | null: false                    |
| person          | string     | null: false                    |
| date            | date       | null: false                    |
| place           | string     | null: false                    |
| purpose         | text       | null: false                    |
| relation_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :profile

## commentsテーブル

| Column   | Type       | Options                        |
| ------   | ----       | -------                        |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| schedule | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :schedule

## profiles テーブル

| Column              | Type       | Options                        |
| ------              | ----       | -------                        |
| customer_first_name | string     | null: false                    |
| customer_last_name  | string     | null: false                    |
| customer_occupation | string     | null: false                    |
| position            | string     | null: false                    |
| note                | text       |                                |
| schedule            | references | null: false, foreign_key: true |

### Association

- belongs_to :schedule