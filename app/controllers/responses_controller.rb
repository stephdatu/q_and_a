class ResponsesController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]
before_filter :find_discussion
before_filter :find_response, only: [:show, :edit, :update, :destroy]

  def new
    @response = @discussion.responses.build
  end

  def create
    @response = @discussion.responses.build(params[:response])
    @response.user = current_user
    if @response.save
      flash[:notice] = "Response has been created."
      redirect_to [@discussion, @response]
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
      redirect_to [@discussion, @response]
    else
      flash[:alert] = "Response has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @response.destroy
    flash[:notice] = "Response has been deleted."
    redirect_to @discussion
  end

  private
    def find_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def find_response
      @response = @discussion.responses.find(params[:id])
    end
end
