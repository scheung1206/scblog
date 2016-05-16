class WelcomeController < ApplicationController
  def homepage
    @posts = Post.all.order('created_at DESC')
    @posts = @posts.paginate(:page => params[:page], :per_page => 6)
  end
end
