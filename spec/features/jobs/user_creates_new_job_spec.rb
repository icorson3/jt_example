require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job by selecting category" do
    company = Company.create!(name: "ESPN")
    Category.create(title: "Education")

    visit new_company_job_path(company)

    expect(page).to have_css("select#job_category_id")

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Education", from: "job[category_id]"

    click_on "Create Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Education")
  end

  scenario "a user can create a new job by creating a category" do
    company = Company.create!(name: "ESPN")

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    expect(page).to have_link("Create New Category")

  end
end
