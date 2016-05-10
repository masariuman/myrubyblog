class Post < ActiveRecord::Base
    def create
        Post.create(poss_params)
    end
    
    private
    
    def poss_params
        params.require(:post).permit(:title, :body, :category_id, :author_id)
    end
    belongs_to :category
end
