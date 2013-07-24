require 'spec_helper'

feature "Deleting discussions" do
  let!(:discussion) { Factory(:discussion) }
  let!(:user) { Factory(:confirmed_user) }
  let!(:discussion) do
    discussion = Factory(:discussion)
    discussion.update_attribute(:user, user)
    discussion
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link discussion.question
  end

  scenario "Deleting a discussion" do
    click_link "Delete Discussion"
    page.should have_content("Discussion has been deleted.")
  end
end
