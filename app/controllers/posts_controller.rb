class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user
    @posts = Post.all.order('created_at DESC')
    @posts = @posts.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title,:body,:image, :ytlink))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def sortable_date
    created_at.to_datetime
  end 
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :ytlink)
  end
end
