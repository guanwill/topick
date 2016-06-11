class PhotosController < ApplicationController
  def index
    @photo = Photo.paginate(:page => params[:page], per_page: 3).order('id DESC')
    @user = User.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.user = current_user
    @photo.image = params[:photo][:image]
    @photo.description = params[:photo][:description]
    @photo.save

    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to photos_path
    else
      flash[:success] = "Error. Wrong file type"
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      flash[:success] = "Successful"
      redirect_to photos_path
    else
      flash.now[:alert] = "Error"
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "The photo was destroyed."
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_all = Photo.all
  end

  def likes
    @newlike = Like.new
    @newlike.user_id = current_user.id
    @newlike.photo_id = params[:like][:photo_id]
    @newlike.save
    if @newlike.save
      redirect_to photos_path
    end
  end

  def like_destroy
    like = Like.where(:user_id => current_user.id, :photo_id => params[:photo_id])
    like.each do |like|
      like.destroy
    end
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :user, :description)
  end
end
