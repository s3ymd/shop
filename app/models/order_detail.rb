# 注文明細
class OrderDetail < ActiveRecord::Base
  # 注文に属する
  belongs_to :order

  # 商品に属する
  belongs_to :item

end
