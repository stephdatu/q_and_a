require 'spec_helper'

feature "Editing responses" do
  let!(:discussion) { Factory(:discussion) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:response) do
    response = Factory(:response, discussion: discussion)
    response.update_attribute(:user, user)
    response
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link discussion.question
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
