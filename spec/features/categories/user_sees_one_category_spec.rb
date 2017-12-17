require 'rails_helper'

describe "User sees a specific category" do
  scenario "a user sees a category for a specific company" do
    category = Category.create(title: "Education")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit category_path(category)

    expect(page).to have_content(job.title)
  end
end
