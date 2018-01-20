class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been shared"
      redirect_to @post
    else
      flash[:alert] = "Posts must have an image"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:caption, :image)
    end

end
