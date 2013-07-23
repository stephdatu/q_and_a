require 'spec_helper'

feature 'Deleting responses' do
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
  end

  scenario "Deleting a response" do
    click_link "Delete Response"
    page.should have_content("Response has been deleted.")
    page.current_url.should == discussion_url(discussion)
  end
end
