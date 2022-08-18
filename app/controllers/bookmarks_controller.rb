class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  # def index
  #   @bookmarks = Bookmark.all
  # end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    movie_id = params["bookmark"]["movie_id"].to_i
    movie = Movie.find(movie_id)
    @bookmark.movie = movie


    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

    # redirect_to bookmark_path(@bookmark) if @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
