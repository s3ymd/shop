class CartController < ApplicationController
  def index
  end

  def add
    session[:cart] ||= {}

    item_id = params[:item_id]
    unless item_id
      redirect_to :cart_index, alert: 'カートに追加する商品を指定してください'
    end

    q = (session[:cart][item_id] || 0) + 1
    session[:cart][item_id] = q

    redirect_to :cart_index, notice: 'カートに商品を追加しました'
  end


  # ログインしていない場合は、ログイン / 会員登録
  def step1
    if signed_in?
      redirect_to :cart_step2
    end
  end

  # お支払い方法の選択
  def step2
    u = current_user
    @order = Order.new do |o|
      o.user = u
      o.postal_code = u.postal_code
      o.address = u.address
      o.name = u.name
      o.tel = u.tel
    end
    session[:order] = @order
  end

  def step2_submit
    @order = Order.new(session[:order])
    @order.attributes = order_params
    session[:order] = @order

    if @order.valid?
      redirect_to :cart_step3
    else
      redirect_to :cart_step2, alert: '未入力の項目があります'
    end
  end

  # 商品お届け先の入力
  def step3
    @order = Order.new(session[:order])
  end

  def step3_submit
    @order = Order.new(session[:order])
    @order.attributes = order_params
    session[:order] = @order

    if @order.valid?
      redirect_to :cart_step4
    else
      redirect_to :cart_step3, alert: '未入力の項目があります'
    end
  end

  # ご注文内容の最終確認
  def step4
    @order = Order.new(session[:order])
  end

  # ご注文完了
  def step5
    @order = Order.new(session[:order])

    Order.transaction do
      @order.save
      session[:cart].each do |item_id, quantity|
        OrderDetail.create(order: @order, item_id: item_id, quantity: quantity)
      end
    end

    session[:order] = nil
    session[:cart] = {}

    redirect_to :root, notice: 'ご注文ありがとうございました'

  end

  private
    def order_params
      params.fetch(:order, {}).permit(:payment_method, :name, :tel, :postal_code, :address)
    end

end
