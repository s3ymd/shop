# 商品カテゴリ
class Category < ActiveRecord::Base

  # 複数の商品を持つ
  has_many :items
end
