require 'spec_helper'

feature "Creating Responses" do
  before do
    Factory(:discussion, question: "What is Rails?")
    user = Factory(:user, email: "qanda@example.com")
    user.confirm!

    visit '/'
    click_link "What is Rails?"
    click_link "New Response"
    message = "You need to sign in or sign up before continuing."
    page.should have_content(message)

    fill_in "Email", with: "qanda@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Response") }
  end

  scenario "Creating a response" do
    fill_in "Answer", with: "An open source web application framework"
    click_button "Create Response"
    page.should have_content("Response has been created.")
    within("#response #author") do
      page.should have_content("Created by qanda@example.com")
    end
  end

  scenario "Creating a response without valid attributes fails" do
    click_button "Create Response"
    page.should have_content("Response has not been created.")
    page.should have_content("Answer can't be blank")
  end
end
