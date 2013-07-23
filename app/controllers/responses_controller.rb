class ResponsesController < ApplicationController
before_filter :find_session
before_filter :find_response, only: [:show, :edit, :update, :destroy]

  def new
    @response = @session.responses.build
  end

  def create
    @response = @session.responses.build(params[:response])
    if @response.save
      flash[:notice] = "Response has been created."
      redirect_to [@session, @response]
    else
      flash[:alert] = "Response has not been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @response.update_attributes(params[:response])
      flash[:notice] = "Response has been updated."
      redirect_to [@session, @response]
    else
      flash[:alert] = "Response has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @response.destroy
    flash[:notice] = "Response has been deleted."
    redirect_to @session
  end

  private
    def find_session
      @session = Session.find(params[:session_id])
    end

    def find_response
      @response = @session.responses.find(params[:id])
    end
end
