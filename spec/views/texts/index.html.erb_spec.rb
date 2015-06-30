require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe "texts/index", type: :view do
  before { visit root_path }
  expect(page).to have_title("まメme夢モゥ")
end
