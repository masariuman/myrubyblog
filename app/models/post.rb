class Post < ActiveRecord::Base
    def create
        Post.create(poss_params)
    end
    
    private
    
    def poss_params
        params.require(:post).permit(:title, :body, :category_id, :admin_user_id)
    end
    belongs_to :category
    belongs_to :admin_user
    has_many :post_comment, :dependent => :destroy
    validates :title, :presence => true
    validates_length_of :body, :minimum => 10
    
#    def self.search(search)
#        where("title ILIKE ?", "%#{search}%") 
#        where("body ILIKE ?", "%#{search}%")
#    end
   
end
