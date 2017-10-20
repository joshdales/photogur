class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index, :year]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @older_than_month = Picture.created_before(1.month.ago)
    @years = Picture.getting_year
  end

  def show
  end

  def year
    @pictures = Picture.created_in_year(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title   = params[:picture][:title]
    @picture.artist  = params[:picture][:artist]
    @picture.url     = params[:picture][:url]
    @picture.user_id = current_user.id

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to root_url
    else
      # othewise render new.html.erb
      render :new
    end
  end

  def edit
  end

  def update
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to show_picture_url(@picture.id)
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to root_url
  end

end
