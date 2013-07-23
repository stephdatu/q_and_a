require 'spec_helper'

feature "Editing responses" do
  let!(:session) { Factory(:session) }
  let!(:response) { Factory(:response, session: session) }

  before do
    visit '/'
    click_link session.question
    click_link response.answer
    click_link "Edit Response"
  end

  scenario "Updating a response" do
    fill_in "Answer", with: "Pi squared"
    click_button "Update Response"
    page.should have_content "Response has been updated."
    within("#response h2") do
      page.should have_content("Pi squared")
    end
    page.should_not have_content response.answer
    end

  scenario "Updating a response with invalid information" do
    fill_in "Answer", with: ""
    click_button "Update Response"
    page.should have_content("Response has not been updated.")
  end
end
