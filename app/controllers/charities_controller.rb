class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end
  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charities_params)
    if @charity.save
      flash[:notice] ="Successfully created a charity"
      redirect_to root_path
    else
      render 'new'
    end 
    #return render body: @charity.inspect
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def edit
    @charity = Charity.find(params[:id])

  end
  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charities_params)
      flash[:notice] ="Successfully updated a charity"
      redirect_to root_path
    else
      render 'edit'
    end 
  end
  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    flash[:notice] ="Successfully destroyed a charity"
    redirect_to root_path
  end

  private

  def charities_params
    params.require(:charity).permit(:name,:description,:user_id)
  end
end
