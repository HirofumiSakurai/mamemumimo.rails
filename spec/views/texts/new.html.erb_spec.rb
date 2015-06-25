require 'rails_helper'

RSpec.describe "texts/new", type: :view do
  before(:each) do
    assign(:text, Text.new(
      :entity => "MyString",
      :parent => 1,
      :latest => false
    ))
  end

  it "renders new text form" do
    render

    assert_select "form[action=?][method=?]", texts_path, "post" do

      assert_select "input#text_entity[name=?]", "text[entity]"

      assert_select "input#text_parent[name=?]", "text[parent]"

      assert_select "input#text_latest[name=?]", "text[latest]"
    end
  end
end
