class Category < ActiveRecord::Base
    def create
        Category.create(category_params)
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    has_many :posts
end
