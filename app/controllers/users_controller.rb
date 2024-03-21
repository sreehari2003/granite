class UsersController < ApplicationController
  def index
    users = User.select(:id, :name)
    render status: :ok, json: { users: }
  end

  def show
    user = User.find(user_params)
    render status: :ok,json: { user: }
  end


  private
   def user_params
    params.require(:id)
   end
end