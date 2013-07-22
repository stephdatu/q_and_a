require 'spec_helper'

describe SessionsController do
  it "displays an error for a missing session" do
    get :show, id: "not-here"
    response.should redirect_to(sessions_path)
    message = "The session you were looking for could not be found."
    flash[:alert].should == message
  end
end
