require 'spec_helper'

feature "Deleting discussions" do
  scenario "Deleting a discussion" do
    Factory(:discussion, question: "What is the meaning of life?")
    visit "/"
    click_link "What is the meaning of life?"
    click_link "Delete Discussion"
    page.should have_content("Discussion has been deleted.")

    visit "/"
    page.should_not have_content("What is the meaning of life?")
  end
end
