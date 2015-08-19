# 注文
class Order < ActiveRecord::Base
  # ユーザーに属する
  belongs_to :user

  # 複数の注文明細を持つ
  has_many :order_details

  # 各項目は入力必須とする
  validates :payment_method, :postal_code, :address, :name, :tel, presence: true
end
