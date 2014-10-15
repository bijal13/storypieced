class StoryUpdatesController < ApplicationController

  before_action :get_story, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @story_updates = Story_Update.all
  end

  def new
    @story_upate = Story_update.new
    @story_update.save
  end

  def create
    @story_update = Story_update.new(story_params)

    if @story_update.save
    redirect_to @story_update
    else
      render 'show'
    end
  end

  def show
  end

  def edit
  end

  def update
      if @story_update.update(story_params)
        redirect_to @story_update, notice: 'The story was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @story_update.destroy
    redirect_to stories_url, notice: 'The story update was successfully deleted.'
  end

  private

  def get_story
    @story = Story.find(params[:id])
  end

  def story_params
  params.require(:story).permit([:title, :write])
  end

end
end
