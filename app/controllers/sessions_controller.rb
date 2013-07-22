class SessionsController < ApplicationController
  def index
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    if @session.save
      flash[:notice] = "Session has been created."
      redirect_to @session
    else
      # nothing, yet
    end
  end

  def show
    @session = Session.find(params[:id])
  end
end
