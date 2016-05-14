class ApplicationController < ActionController::Base
    before_action :search_default
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    helper_method :all_categories
    helper_method :all_posts
    
    def all_categories
        @categories = Category.all
    end
    
    def all_posts
        @posts = Post.all
    end
    
    
    def search_default
        @q = Post.ransack(params[:q])
    end
    
    def post_params
        params.require(:post).permit(:title, :body, :category_id)
    end
end