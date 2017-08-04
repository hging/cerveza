# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#

class Product < ApplicationRecord
  before_create :generate_slug

  def generate_slug
    loop do
      token = SecureRandom.hex(6)
      break self.slug = token unless Product.exists?(:slug => token)
    end
  end
end
