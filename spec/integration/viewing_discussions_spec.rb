require 'spec_helper'

feature "Viewing discussions" do
  scenario "Listing all discussions" do
    discussion = Factory.create(:discussion, question: "What is the meaning of life?")
    visit '/'
    click_link 'What is the meaning of life?'
    page.current_url.should == discussion_url(discussion)
  end
end
