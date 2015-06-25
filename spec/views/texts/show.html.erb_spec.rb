require 'rails_helper'

RSpec.describe "texts/show", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :entity => "Entity",
      :parent => 1,
      :latest => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Entity/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
  end
end
