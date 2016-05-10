class Category < ActiveRecord::Base
    def create
        Kategori.create(kategori_params)
    end
    
    private
    
    def kategori_params
        params.require(:kategori).permit(:name)
    end
    has_many :posts
end
