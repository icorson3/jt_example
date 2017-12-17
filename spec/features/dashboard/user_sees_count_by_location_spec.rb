require 'rails_helper'

describe "User can get jobs by city" do
  scenario "user gets job by one city" do
    category = Category.create(title: "Education")
    company_1 = Company.create!(name: "ESPN")
    company_2 = Company.create!(name: "ESPN2")
    job_1 = company_1.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_2 = company_2.jobs.create!(title: "Developer1", level_of_interest: 70, city: "Denver", category: category)
    job_3 = company_1.jobs.create!(title: "QA Analyst1", level_of_interest: 60, city: "New York", category: category)

# A count of jobs by `location` with a link to visit a page with jobs only in that location. The url should be `/jobs?location=Denver`.
    visit "/dashboard"

    expect(page).to have_link("Denver: 2")
    expect(page).to have_link("New York: 1")

    click_on "Denver: 2"
    
    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_3.title)
  end
end
