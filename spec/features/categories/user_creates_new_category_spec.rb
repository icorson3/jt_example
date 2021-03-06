require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[title]", with: "Education"

    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Education")
  end
end
