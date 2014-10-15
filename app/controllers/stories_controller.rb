class StoriesController < ApplicationController

  before_action :get_story, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @story.save
  end

  def create
    @story = Story.new(story_params)

    if @story.save
    redirect_to @story
    else
      render 'show'
    end
  end

  def show
  end

  def edit
  end

  def update
      if @story.update(story_params)
        redirect_to @story, notice: 'The story was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @story.destroy
    redirect_to stories_url, notice: 'The story was successfully deleted.'
  end

  private

  def get_story
    @story = Story.find(params[:id])
  end

  def story_params
  params.require(:story).permit([:title, :write])
  end

end
