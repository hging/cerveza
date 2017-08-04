class CreatePingppChargeService
  def initialize(order, channel)
    @order = order
    @channel = channel
  end
  
  def perform
    Pingpp::Charge(
      :order_no => hash_id.encode(@order.id),
      :amount => @order.amount,
      :subject => "支付订单#{hash_id.encode(@order.id)}"
    )
    
  end
  
end
