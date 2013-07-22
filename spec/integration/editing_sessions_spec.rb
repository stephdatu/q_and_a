require 'spec_helper'

feature "Editing Sessions" do
  before do
    Factory(:session, question: "What is the meaning of life?")
    visit "/"
    click_link "What is the meaning of life?"
    click_link "Edit Session"
  end

  scenario "Updating a session" do
    fill_in "Question", with: "What is the meaning of human life?"
    click_button "Update Session"
    page.should have_content("Session has been updated.")
  end

  scenario "Updating a session with invalid attributes is bad" do
    fill_in "Question", with: ""
    click_button "Update Session"
    page.should have_content("Session has not been updated.")
  end
end
