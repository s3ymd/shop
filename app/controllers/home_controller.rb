class HomeController < ApplicationController
  def index

    # ランキング：売上明細から計算する。商品ごとにグループ化し、売上数量の合計の多い順に並べ、上位3件を取り出し、そのキー（商品ID）だけを取り出す
    @ranking = OrderDetail.limit(3).group(:item_id).order('sum_quantity desc').sum(:quantity).keys

    # おすすめ商品
    # TODO 商品に「おすすめ商品」フラグを追加。フラグがtrueの場合はおすすめ商品とする
    @recommends = Item.all
  end

  # お問い合わせ
  def inquiry

  end

  # 会員情報
  def my_info

  end

  # ご注文履歴
  def my_orders
    @orders = Order.where(user: current_user).order(:created_at)
  end

  # 商品検索
  def search
    @items = Item.all

    # カテゴリ指定時
    if params[:category_id]
      @items = @items.where(category_id: params[:category_id])
    end

    # キーワード指定時
    if params[:keyword]
      like_keyword = "%#{params[:keyword]}%"
      @items = @items.where(%q<name like ? or description like ?>, like_keyword, like_keyword)
    end
  end

  # 新規会員登録
  def create_account
    
  end

end
