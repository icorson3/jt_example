require 'rails_helper'

describe "User destroys a category" do
  scenario "a user sees destroys a category for a specific company" do
    category = Category.create(title: "Education")

    visit categories_path

    within(".categories") do
      click_on "Delete Category"
    end

    expect(page).to_not have_content("Education")
  end
end
