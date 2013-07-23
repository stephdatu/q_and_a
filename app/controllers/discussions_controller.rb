class DiscussionsController < ApplicationController
before_filter :find_discussion, only: [:show, :edit, :update, :destroy]

  def index
    @discussions = Discussion.all
  end

  def show
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
      flash[:notice] = "Discussion has been created."
      redirect_to @discussion
    else
      flash[:alert] = "Discussion has not been created."
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @discussion.update_attributes(params[:discussion])
      # @discussion.users << current_user unless current_user.in? @discussion.users
      # @discussion.users |= [current_user]
      flash[:notice] = "Discussion has been updated."
      redirect_to @discussion
    else
      flash[:alert] = "Discussion has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @discussion.destroy
    flash[:notice] = "Discussion has been deleted."
    redirect_to discussions_path
  end

  private
    def find_discussion
      @discussion = Discussion.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The discussion you were looking for could not be found."
      redirect_to discussions_path
    end
end
