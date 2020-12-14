class UsersController < ApplicationController

  def index
    # authorize :user, :manager?
    @users = User.all
  end
end
