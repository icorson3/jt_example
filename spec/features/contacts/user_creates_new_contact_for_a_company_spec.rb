require 'rails_helper'

describe "User creates a new comment for a job" do
  before(:each) do
    @company = Company.create!(name: "ESPN")

    visit company_jobs_path(@company)

    fill_in "contact[full_name]", with: "Ilana Corson"
    fill_in "contact[position]", with: "Reporter"
    fill_in "contact[email]", with: "ilana@test.com"

    click_button "Create Contact"
  end

  scenario "a user can create a new contact" do

    expect(current_path).to eq("/companies/#{@company.id}/jobs")
    expect(page).to have_content(@company.contacts.last.full_name)
    expect(page).to have_content(@company.contacts.last.position)
    expect(page).to have_content(@company.contacts.last.email)
  end
  #
  # scenario "a user see newest comment at top" do
  #   fill_in "comment[content]", with: "This job is greatish"
  #   click_button "Create Comment"
  #
  #   within(".comments", match: :first) do
  #     expect(page).to have_content("This job is greatish")
  #   end
  # end
end
