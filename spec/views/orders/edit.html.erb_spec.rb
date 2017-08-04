require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user => nil,
      :amount => 1,
      :state => ""
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[amount]"

      assert_select "input[name=?]", "order[state]"
    end
  end
end
