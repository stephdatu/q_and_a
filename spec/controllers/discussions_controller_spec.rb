require 'spec_helper'

describe DiscussionsController do
  it "displays an error for a missing discussion" do
    get :show, id: "not-here"
    response.should redirect_to(discussions_path)
    message = "The discussion you were looking for could not be found."
    flash[:alert].should == message
  end
end
