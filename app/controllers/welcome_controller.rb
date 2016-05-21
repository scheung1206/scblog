class WelcomeController < ApplicationController
  def homepage
    @posts = Post.all.order('created_at DESC')
    @reviews = Review.all.order('created_at DESC')
    @news = @posts + @reviews
    @news.sort_by!(&:created_at).reverse!

    @news = @news.paginate(:page => params[:page], :per_page => 6)
  end
end
