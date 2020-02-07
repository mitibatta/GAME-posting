class FavoritesController < ApplicationController
  
  def index
    @favorite_posts = current_user.favorite_posts
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.post_id = params[:post_id]

    if @favorite.save
      redirect_to posts_path
    else
      redirect_to posts_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_to posts_path
  end
  
end

  
