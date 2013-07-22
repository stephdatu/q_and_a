require 'spec_helper'

feature "Deleting sessions" do
  scenario "Deleting a session" do
    Factory(:session, question: "What is the meaning of life?")
    visit "/"
    click_link "What is the meaning of life?"
    click_link "Delete Session"
    page.should have_content("Session has been deleted.")

    visit "/"
    page.should_not have_content("What is the meaning of life?")
  end
end
