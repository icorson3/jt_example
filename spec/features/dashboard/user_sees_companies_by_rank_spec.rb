require 'rails_helper'

describe "User can get jobs by city" do
  scenario "user gets job by one city" do
    category = Category.create(title: "Education")
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ESPN2")
    company_3 = Company.create!(name: "ESPN3")
    company_4 = Company.create!(name: "ESPN4")
    job_1 = company_1.jobs.create!(title: "Developer2", level_of_interest: 80, city: "Denver", category: category)
    job_2 = company_1.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_3 = company_2.jobs.create!(title: "QA Analyst1", level_of_interest: 90, city: "New York", category: category)
    job_4 = company_2.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_5 = company_3.jobs.create!(title: "QA Analyst1", level_of_interest: 60, city: "New York", category: category)
    job_6 = company_3.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_7 = company_4.jobs.create!(title: "QA Analyst1", level_of_interest: 60, city: "New York", category: category)
    job_8 = company_4.jobs.create!(title: "Developer1", level_of_interest: 60, city: "Denver", category: category)

# The top three copanies ranked by average level of interest along with their respective average level of interest.
    visit "/dashboard"

    within('.top-three', match: :first) do
      expect(page).to have_content(company_2.name)
      expect(page).to have_content("Average Level of Interest: 80")
    end
  end
end
