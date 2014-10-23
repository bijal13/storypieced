class StoriesController < ApplicationController

  before_action :get_story, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
    redirect_to story_path(@story), notice: 'The story was successfully created.'
    else
      render :new
    end
  end

  def show
    @storyupdate = @story.storyupdates.build
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

  def do_not_check_authorization?
   respond_to?(:devise_controller?)
  end

end
