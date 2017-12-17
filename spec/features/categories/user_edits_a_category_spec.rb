require 'rails_helper'

describe "User updates a category" do
  scenario "a user sees updates a category for a specific company" do
    category = Category.create(title: "Education")

    visit categories_path

    within(".categories") do
      click_on "Edit Category"
    end

    fill_in "category[title]", with: "Finance"
    click_on "Update Category"

    expect(page).to have_content("Finance")
  end
end
