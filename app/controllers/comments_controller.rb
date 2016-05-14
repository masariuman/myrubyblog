class CommentsController < InheritedResources::Base
    
    def create
        @comment = Comment.new(comment_params)
        
        if @comment.save
            flash[:notice] = 'Comment was successfully Created.'
            redirect_to(@comment.post)
        else
            flash[:notice] = "Error Creating post comment : #{@post_comment.errors}"
            redirect_to(@post_comment.post)
        end
    end

    private
    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end