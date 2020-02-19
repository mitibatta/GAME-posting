class Api::FavoritesController < ApplicationController
  PER = 7
  
  
  def index
    favorite_post = current_user.favorite_posts.page(params[:page]).per(PER).select(:id, :user_id, :post_id)
    
    render json: favorite_post
    
  end

  def create
    current_user.favorites.create!(favorite_params)
    head :created
  end

  def destroy
    current_user.favorites.find(params[:id]).destroy!
    head :ok
  end
  
  private
  def favorite_params
    params.require(:favorites).permit(:post_id)
  end
  
end
