require 'rails_helper'

describe "User destroys a specific job" do
  scenario "a user destroys a job for a specific company" do
    category = Category.create(title: "Education")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_jobs_path(company)


    within(".jobs", match: :first) do
      click_on "Delete Job"
    end

    expect(page).to have_content("ESPN")
    expect(page).to_not have_content("Developer")
  end
end
