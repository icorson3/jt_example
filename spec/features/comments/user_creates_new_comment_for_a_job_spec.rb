require 'rails_helper'

describe "User creates a new comment for a job" do
  before(:each) do
    category = Category.create(title: "Education")
    @company = Company.create!(name: "ESPN")
    @job = @company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_job_path(@company, @job)

    fill_in "comment[content]", with: "This job is great"
    click_button "Create Comment"
  end
  scenario "a user can create a new comment" do

    expect(current_path).to eq("/companies/#{@company.id}/jobs/#{@job.id}")
    expect(page).to have_content("This job is great")
  end

  scenario "a user see newest comment at top" do
    fill_in "comment[content]", with: "This job is greatish"
    click_button "Create Comment"

    within(".comments", match: :first) do
      expect(page).to have_content("This job is greatish")
    end
  end
end
