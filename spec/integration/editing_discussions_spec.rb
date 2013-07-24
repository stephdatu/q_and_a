require 'spec_helper'

feature "Editing Discussions" do
  let!(:discussion) { Factory(:discussion) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:discussion) do
    discussion = Factory(:discussion)
    discussion.update_attribute(:user, user)
    discussion
  end

  before do
    sign_in_as!(user)
    visit "/"
    click_link discussion.question
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
