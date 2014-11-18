
class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @posted_quests = DeliveryQuest.where(quest_giver: @user)
    @accepted_quests = DeliveryQuest.where(quester: @user, completed: false)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      log_in @user
      flash[:success] = "Welcome to " + Constant.app_name
      redirect_to profile_path
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
