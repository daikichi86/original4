# アプリ名(未完成)

## Discover great places

### アプリの目的
・自分のお気に入りの場所を投稿できるアプリの作成  
・Tech campのカリキュラムで得た内容の復習

### 制作背景(制作にあたっての意図)
・bootstrap4を使用したwebサイト

### 使用した言語
Ruby、HTML、CSS、Javascript

### ソース管理
Github

# 課題や実装したい機能
・webpackerで使用したbootstrapのCSS,JSの読み込み  
・herokuへのデプロイ  
・AWS S3による画像のストレージ管理  
・Active:Hashによって読み込まれたカテゴリーと国のリストをselect2を利用し、ビューを調整させること。

# データベース

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| encrypted_password | string | null: false |

### Association

-has_many :places  
-has_many :comments, dependent: :destroy

## places テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name | string | null: false |
| info | text | null: false |
| category_id | integer | null: false |
| country_id | integer | null: false |
| user   | references | null: false, foreign_key: true |

### Association

-has_one_attached :image  
-belongs_to :user  
-has_many :comments, dependent: :destroy

-extend ActiveHash::Associations::ActiveRecordExtensions  
  -belongs_to :category  
  -belongs_to :country

## comments テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text | text | null: false |
| user   | references | null: false, foreign_key: true |
| place   | references | null: false, foreign_key: true |

### Association

-belongs_to :user  
-belongs_to :place