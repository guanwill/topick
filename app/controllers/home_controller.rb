class HomeController < ApplicationController
  def index
    @photo = Photo.all
  end



end
