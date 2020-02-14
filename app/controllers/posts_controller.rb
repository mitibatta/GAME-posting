class PostsController < ApplicationController
  PER = 7
  
  def new
    @post = Post.new
    @post.pictures.build
  end
  
  def index
    @posts = Post.page(params[:page]).per(PER).order(created_at: :desc).includes(:favorite_users)
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: "投稿完了"
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id:params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user.id), success:"投稿を編集しました。"
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path, success:"投稿を削除しました。"
  end
  
  private
  def post_params
    params.require(:post).permit(:text, pictures_attributes: [:image, :video, :id, :user_id, :post_id])
  end
  
end
