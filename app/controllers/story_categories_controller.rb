class StoryCategoriesController < ApplicationController
	def index
    @story_categories = StoryCategory.all
  end
  def new
    @story_category = StoryCategory.new
  end

  def create
    @story_category = StoryCategory.new(story_categories_params)
    if @story_category.save
      flash[:notice] ="Successfully created a story_category"
      redirect_to root_path
    else
      render 'new'
    end 
    #return render body: @charity.inspect
  end

  def show
    @story_category = StoryCategory.find(params[:id])
  end

  def edit
    @story_category = StoryCategory.find(params[:id])

  end
  def update
    @story_category = StoryCategory.find(params[:id])
    if @story_category.update(story_categories_params)
      flash[:notice] ="Successfully updated a story_category"
      redirect_to root_path
    else
      render 'edit'
    end 
  end
  def destroy
    @story_category = StoryCategory.find(params[:id])
    @story_category.destroy
    flash[:notice] ="Successfully destroyed a story_category"
    redirect_to root_path
  end

  private

  def story_categories_params
    params.require(:story_category).permit(:name,:description,:project_id)
  end
end
