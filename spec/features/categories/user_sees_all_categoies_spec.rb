require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    category_1 = Category.create!(title: "Education")
    category_2 = Category.create!(title: "Finance")

    visit categories_path

    expect(page).to have_content(category_1.title)
    expect(page).to have_content(category_2.title)
  end
end
