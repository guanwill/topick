class HomeController < ApplicationController
  def index
    @photo = Photo.all
    # @photos1 = Photo.find(params[:user_id])
  end



end
