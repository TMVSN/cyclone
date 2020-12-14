class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def add_user
    @password = 'password'
    @user = User.new(user_params)
    @user.password = @password
    @user.save
    if @user.save
      redirect_to '/users'
    else
      render 'new'
    end
  end


  def index
    # authorize :user, :manager?
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :manager, :fixer)
  end
end
