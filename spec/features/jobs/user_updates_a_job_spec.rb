require 'rails_helper'

describe "User updates a job" do
  scenario "a user sees updates a job for a specific company" do
    category = Category.create(title: "Education")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Anchor"
    fill_in "job[description]", with: "Maybe So fun!"
    fill_in "job[level_of_interest]", with: 91
    fill_in "job[city]", with: "SF"
    click_on "Update Job"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Maybe So fun!")
    expect(page).to have_content(91)
    expect(page).to have_content("SF")
  end
end
