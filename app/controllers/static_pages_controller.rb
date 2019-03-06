class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = Post.new
      @posts = current_user.feed.paginate(page: params[:page],per_page: 5)
      
      render("users/home_feed") 
    end
    
  end

  def about
  end
end
