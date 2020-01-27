class StoriesController < ApplicationController
	def index
    @stories = Story.all
  end
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(stories_params)
    @story.story_category_id = Project.find(@story.project_id).story_categories.first.id
    return render body: @story.inspect
    if @story.save
      flash[:notice] ="Successfully created a story"
      redirect_to root_path
    else
      render 'new'
    end 
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end
  def update
    @story = Story.find(params[:id])
    if @story.update(stories_params)
      flash[:notice] ="Successfully updated a story"
      redirect_to root_path
    else
      render 'edit'
    end 
  end
  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] ="Successfully destroyed a story"
    redirect_to root_path
  end

  private

  def stories_params
    params.require(:story).permit(:name,:description,:project_id,:story_category_id)
  end
end
