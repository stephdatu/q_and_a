require 'spec_helper'

feature "Creating Responses" do
  before do
    Factory(:discussion, question: "What is Rails?")
    visit '/'
    click_link "What is Rails?"
    click_link "New Response"
  end

  scenario "Creating a response" do
    fill_in "Answer", with: "An open source web application framework"
    click_button "Create Response"
    page.should have_content("Response has been created.")
  end

  scenario "Creating a response without valid attributes fails" do
    click_button "Create Response"
    page.should have_content("Response has not been created.")
    page.should have_content("Answer can't be blank")
  end
end
