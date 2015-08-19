# 商品
class Item < ActiveRecord::Base

  # カテゴリに属する
  belongs_to :category
end
