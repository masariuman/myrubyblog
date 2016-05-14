class PostsController < ApplicationController
    def index
        @post = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
        @user = AdminUser.all
        @comment = PostComment.new(:post => @post)
    end
    
    def new
        @post = Post.new
        @category = Category.all
    end
    
    def create
#        @post = Post.new(params[:post])
        @post = Post.create(post_params)
        if @post.save
            redirect_to posts_path, :notice => "Your post has been saved"
        else
            render "new"
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
#        @post = Post.create(post_params)
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            redirect_to posts_path, :notice => "Your Post Has Been Updated"
        else
            render "edit"
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, :notice => "Your Post Has Been Deleted"
    end
    
    def post_params
        params.require(:post).permit(:title, :body, :category_id)
    end
    
end
