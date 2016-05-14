class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
    
    def create
        AA.create(aa_params)
    end
    
    private
    
    def aa_params
        params.require(:aa).permit(:name, :email, :password, :password_confirmation, :remember_me)
    end
    has_many :posts
end
