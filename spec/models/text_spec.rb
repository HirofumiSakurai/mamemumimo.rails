require 'rails_helper'
require 'spec_helper'

describe Text, type: :model do
  let (:text) {Text.new(entity:"test.")}

  subject {text}

  it {should respond_to(:entity)}
  it {should respond_to(:parent_id)}
  it {should respond_to(:latest)}
  it {should respond_to(:latest?)}
  it {should respond_to(:parent)}
  it {should respond_to(:parent=)}
  it {should respond_to(:childs)}

  it { expect(text.entity).to eq "test."}

  describe "default values" do
    it { expect(text.parent).to be_nil}
    it { expect(text.latest).to eq true}
  end

  describe "validation check of entity" do
    before {text.entity = ''}

    it {should_not be_valid}
  end

  describe "validation check of parent" do
    let(:new_parent) {Text.create(entity: "parent")}
    before do
      text.parent = new_parent
    end

    it {should be_valid}
    it {expect(text.parent_id).not_to eq -1}
    it {expect(text.parent_id).to eq new_parent.id}
    it {expect(text.parent).not_to be_nil}
    it {expect(text.parent.entity).to eq "parent"}
  end

  describe "append_entity" do
    before {text.append_entity("append test")}

    it {expect(text.entity).to eq "test.\nappend test"}
  end
end
