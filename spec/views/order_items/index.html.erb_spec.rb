require 'spec_helper'

describe "order_items/index" do
  before(:each) do
    assign(:order_items, [
      stub_model(OrderItem,
        :product_id => 1,
        :order_id => 2,
        :quantity => 3
      ),
      stub_model(OrderItem,
        :product_id => 1,
        :order_id => 2,
        :quantity => 3
      )
    ])
  end

  it "renders a list of order_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
