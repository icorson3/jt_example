require 'rails_helper'

describe "User can see level_of_interest by count" do
  scenario "user count is reflected" do
    category = Category.create(title: "Education")
    company = Company.create!(name: "ESPN")
    job_1 = company.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_2 = company.jobs.create!(title: "Developer2", level_of_interest: 80, city: "Denver", category: category)
    job_3 = company.jobs.create!(title: "Developer3", level_of_interest: 70, city: "Denver", category: category)
    job_4 = company.jobs.create!(title: "QA Analyst1", level_of_interest: 90, city: "New York", category: category)

    visit "/dashboard"

    expect(page).to have_content("Level of Interest: 70, Count: 2")
    expect(page).to have_content("Level of Interest: 80, Count: 1")
    expect(page).to have_content("Level of Interest: 90, Count: 1")
  end
end
