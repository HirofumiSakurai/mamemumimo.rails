require 'rails_helper'

RSpec.describe "texts/edit", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :entity => "MyString",
      :parent => 1,
      :latest => false
    ))
  end

  it "renders the edit text form" do
    render

    assert_select "form[action=?][method=?]", text_path(@text), "post" do

      assert_select "input#text_entity[name=?]", "text[entity]"

      assert_select "input#text_parent[name=?]", "text[parent]"

      assert_select "input#text_latest[name=?]", "text[latest]"
    end
  end
end
