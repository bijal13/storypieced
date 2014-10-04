class StoriesController < ApplicationController

  before_action :get_story, only: [:show, :edit, :update, :destroy]

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
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'The story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story}
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'The story was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def get_story
    @story = Story.find(params[:id])
  end

  def story_params
  params.require(:story).permit([:title, :write])
  end

end
