require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  before(:each) do
    assign(:line_item, LineItem.new(
      :order => nil,
      :production => nil,
      :price => 1
    ))
  end

  it "renders new line_item form" do
    render

    assert_select "form[action=?][method=?]", line_items_path, "post" do

      assert_select "input[name=?]", "line_item[order_id]"

      assert_select "input[name=?]", "line_item[production_id]"

      assert_select "input[name=?]", "line_item[price]"
    end
  end
end
