class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:id])
    current_user.favorites.create(blog: @blog)

    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.js
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    favorite = current_user.favorites.find_by(blog: @blog)
    favorite.destroy if favorite

    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.js
    end
  end
end
