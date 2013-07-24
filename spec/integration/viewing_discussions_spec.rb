require 'spec_helper'

feature "Viewing discussions" do
  scenario "Listing all discussions" do
    user = Factory(:user)
    discussion = Factory.create(:discussion, question: "What is the meaning of life?")
    discussion.update_attribute(:user, user)

    visit '/'
    click_link 'What is the meaning of life?'
    page.current_url.should == discussion_url(discussion)
  end
end
