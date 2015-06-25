require 'rails_helper'

RSpec.describe "texts/index", type: :view do
  before(:each) do
    assign(:texts, [
      Text.create!(
        :entity => "Entity",
        :parent => 1,
        :latest => false
      ),
      Text.create!(
        :entity => "Entity",
        :parent => 1,
        :latest => false
      )
    ])
  end

  it "renders a list of texts" do
    render
    assert_select "tr>td", :text => "Entity".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
