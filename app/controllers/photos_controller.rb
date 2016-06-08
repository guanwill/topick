class PhotosController < ApplicationController
  def index
    @photo = Photo.paginate(:page => params[:page], per_page: 2).order('id DESC')
    @user = User.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.user = current_user
    @photo.image = params[:photo][:image]
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

  private

  def photo_params
    params.require(:photo).permit(:image, :user)
  end
end
