require 'spec_helper'

feature "Viewing responses" do
  before do
    whats_life = Factory(:session, question: "What is the meaning of life?")
    Factory(:response,
            session: whats_life,
            answer: "Pi")

    whats_rails = Factory(:session, question: "What is Rails?")
    Factory(:response,
            session: whats_rails,
            answer: "An open source web application framework")

    visit '/'
  end

  scenario "Viewing responses for a given project" do
    click_link "What is the meaning of life?"
    page.should have_content("Pi")
    page.should_not have_content("An open source web application framework")

    click_link "Pi"
    within("#response h2") do
      page.should have_content("Pi")
    end
  end
end
