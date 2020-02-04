class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: "投稿完了"
    else
      frash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end
  
  
  
  
  private
  def post_params
    params.require(:post).permit(:text, :image)
  end
  
end
