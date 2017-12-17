require 'rails_helper'

describe "User can get jobs by city" do
  scenario "user gets job by one city" do
    category = Category.create(title: "Education")
    company = Company.create!(name: "ESPN")
    job_1 = company.jobs.create!(title: "QA Analyst1", level_of_interest: 70, city: "New York", category: category)
    job_2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    job_3 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    job_4 = company.jobs.create!(title: "QA Analyst1", level_of_interest: 70, city: "New York", category: category)

    visit "/jobs?sort=location"

    within('.sorted', match: :first) do
      expect(page).to have_content(job_2.title)
      expect(page).to_not have_content(job_1.title)
    end
  end
end
