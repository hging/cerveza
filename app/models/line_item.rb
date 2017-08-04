# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  price      :integer
#  state      :integer
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_line_items_on_order_id    (order_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#

class LineItem < ApplicationRecord
  include AASM

  belongs_to :order
  belongs_to :product

  enum :state => {
    :just_created => 1, # 刚创建
    :paid         => 2, # 已支付
    :cancel       => 3, # 已取消
    :completed    => 4  # 已提取
  }
  
  aasm :column => :state, :enum => true do
    state :just_created, :initial => true
    state :paid
    state :cancel
    state :completed
  end
end
