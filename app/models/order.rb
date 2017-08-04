# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :integer
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Order < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :line_items
  has_many :products, :through => :line_items

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
