class PostCommentsController < InheritedResources::Base

     
    def create
        @post_comment = PostComment.new(post_comment_params)
        
        if @post_comment.save
            flash[:notice] = 'Comment was successfully Created.'
            redirect_to(@post_comment.post)
        else
            flash[:notice] = "Error Creating post comment : #{@post_comment.errors}"
            redirect_to(@post_comment.post)
        end
    end
    
    private
    def post_comment_params
      params.require(:post_comment).permit(:name, :email, :body, :post_id)
    end
end

