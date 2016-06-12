class HomeController < ApplicationController
  def index
    @photo = Photo.all.order(:cached_votes_score => :desc)
  end



end
