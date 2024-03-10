class HomeController < ApplicationController
  def index
   render status: :ok,json: {message:"Server running on port 3000"}
  end
end