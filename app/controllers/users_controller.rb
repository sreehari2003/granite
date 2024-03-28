class UsersController < ApplicationController
  def index
    users = User.select(:id, :name)
    render status: :ok, json: { users: }
  end

  def show
    user = User.find(user_params)
    render status: :ok,json: { user: }
  end

  def create
    user = User.new(user_params)
    user.save!
    render_notice(t("successfully_created", entity: "User"))

  private
   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end