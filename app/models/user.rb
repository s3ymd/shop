# ユーザ
class User < ActiveRecord::Base

  # パスワードはハッシュ化してDBに格納する
  has_secure_password

  # 複数の注文を持つ
  has_many :orders
end
