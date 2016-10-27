class UsersController < ApplicationController

  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	# binding.pry
  	@user = User.new(user_params)
  	@user.save
  	redirect_to users_list_path
  end
  
  def show
  @user = User.find(params[:id])
  end  

  def edit
  	@user = User.find_by_id(params[:id])
  end

  def update

    # binding.pry
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
    redirect_to users_list_path

  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_list_path
  end

  private

  def user_params
  	params.require(:user).permit(:FirstName,:LastName,:Email,:Password)
  end

end
