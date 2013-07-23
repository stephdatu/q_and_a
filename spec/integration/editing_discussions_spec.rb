require 'spec_helper'

feature "Editing Discussions" do
  before do
    Factory(:discussion, question: "What is the meaning of life?")
    visit "/"
    click_link "What is the meaning of life?"
    click_link "Edit Discussion"
  end

  scenario "Updating a discussion" do
    fill_in "Question", with: "What is the meaning of human life?"
    click_button "Update Discussion"
    page.should have_content("Discussion has been updated.")
  end

  scenario "Updating a discussion with invalid attributes is bad" do
    fill_in "Question", with: ""
    click_button "Update Discussion"
    page.should have_content("Discussion has not been updated.")
  end
end
