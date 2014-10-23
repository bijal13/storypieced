class StoryupdatesController < ApplicationController

  before_action :get_story, only: [:new, :show, :edit, :create, :update, :destroy]
  load_and_authorize_resource

  def index
    @storyupdates = Storyupdate.all
  end

  def new
    @storyupdate = Storyupdate.new
  end

  def create
    byebug
    @storyupdate = @story.storyupdates.build(storyupdates_params)

    if @storyupdate.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
      if @storyupdate.update(storyupdates_params)
        redirect_to story_path(@storyupdate), notice: 'The story was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @storyupdate.destroy
    redirect_to stories_url, notice: 'The story update was successfully deleted.'
  end

  private

  def get_story
    @story = Story.find(params[:story_id])
  end

  def storyupdates_params
    params.require(:storyupdate).permit(:title, :text)
  end

end
