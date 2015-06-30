require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

feature "texts/index" do

  scenario "の構成" do
    visit root_path

    expect(page).to have_title('まメme夢モ')
    expect(page).to have_selector('ul#text-entry')
    expect(page).to have_selector('ul#text-entry p#save')

    expect(page).to have_selector('ul#text-entry li div.display span')
    expect(page).to have_selector('ul#text-entry li div.display span.append-button button.edit')

    expect(page).to have_selector('ul#text-entry li div.append form input')
    expect(page).to have_selector('ul#text-entry li div.append form span input.btn')

    expect(page).to have_selector('ul#text-entry li div.insert form input')
    expect(page).to have_selector('ul#text-entry li div.insert form span input.btn')
  end


  Capybara.javascript_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  # Capybara.javascript_driver = :poltergeist
  feature "の最初の文をクリックすると", :js => true do
    background do
      visit root_path
      Capybara.match = :first
      find("ul#text-entry li").click
    end

    scenario "編集モードになる。" do
      expect(page).to have_selector('li.editing')
    end

    scenario "+ボタンがある。" do
      expect(page).to have_selector('li.editing div.display button')
      expect(find('li.editing div.display')).to have_button('+')
      #save_and_open_screenshot
    end

    feature "編集モードになって、+ボタンを押すと" do
      before do
        find('li.editing div.display button').click
      end

      scenario "追加モードになる。" do
        expect(page).to have_selector('ul#text-entry li.appending')
      end
    end
  end
end
