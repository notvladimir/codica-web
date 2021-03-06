class User < ApplicationRecord
  validates :login_name, presence: true, 
  						 length: { maximum: 40 }, 
  			  			 uniqueness: true

  has_secure_password	 
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
