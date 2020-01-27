class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @charities = Charity.all
    @projects = Project.all
    @story_categories = StoryCategory.all
    @stories = Story.all
  end


  def user_permissions
    # return render body: params.inspect
    # @user = User.new
    @charities = Charity.all
    @users = User.where(role: "customer")
  end


  def set_permissions
    @user = User.find(params[:user_id])
    charity_settings = params[:charity_option]
    project_settings = params[:project_option]
    story_category_settings = params[:story_category_option]
    story_settings = params[:story_option]
    if charity_settings
      if charity_settings == "all"
        @user.settings(:charity_settings).all = true
        @user.settings(:charity_settings).viewable = false
        unless @user.settings(:charity_settings).all_users.include?(@user.id)
          @user.settings(:charity_settings).all_users << @user.id
        end
        @user.settings(:charity_settings).viewable_users = []
      elsif charity_settings == "viewable"
        @user.settings(:charity_settings).viewable = true
        @user.settings(:charity_settings).all = false
        @user.settings(:charity_settings).all_users = []
        @user.settings(:charity_settings).viewable_users << @user.id
      end
    elsif project_settings
      if project_settings == "all"
        @user.settings(:project_settings).all = true
        @user.settings(:project_settings).viewable = false
        @user.settings(:project_settings).all_users << @user.id
        @user.settings(:project_settings).viewable_users = []
      elsif project_settings == "viewable"
        @user.settings(:project_settings).viewable = true
        @user.settings(:project_settings).all = false
        @user.settings(:project_settings).all_users = []
        @user.settings(:project_settings).viewable_users << @user.id
      end
    elsif story_category_settings
      if story_category_settings == "all"
        @user.settings(:story_category_settings).all = true
        @user.settings(:story_category_settings).viewable = false
        @user.settings(:story_category_settings).all_users << @user.id
        @user.settings(:story_category_settings).viewable_users = []
      elsif story_category_settings == "viewable"
        @user.settings(:story_category_settings).viewable = true
        @user.settings(:story_category_settings).all = false
        @user.settings(:story_category_settings).all_users = []
        @user.settings(:story_category_settings).viewable_users << @user.id
      end
    elsif story_settings
      if story_settings == "all"
        @user.settings(:story_settings).all = true
        @user.settings(:story_settings).viewable = false
        @user.settings(:story_settings).all_users << @user.id
        @user.settings(:story_settings).viewable_users = []
      elsif story_settings == "viewable"
        @user.settings(:story_settings).viewable = true
        @user.settings(:story_settings).all = false
        @user.settings(:story_settings).all_users = []
        @user.settings(:story_settings).viewable_users << @user.id
      end
    end
    @user.save
  end
end