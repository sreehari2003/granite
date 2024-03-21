class HomeController < ApplicationController
  def index
   render status: :ok,json: {ok: true,message:"Server running on port 3000"}
  end
end