class WelcomeController < ApplicationController
  def homepage
    @posts = Post.all.order('created_at DESC')
  end
end
