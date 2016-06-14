class HomeController < ApplicationController
  def index
    @photo = Photo.all.order(:cached_votes_score => :desc).paginate(:page => params[:page], per_page: 8).order('id DESC')

  end



end
