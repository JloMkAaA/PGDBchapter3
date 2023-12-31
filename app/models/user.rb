class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    attr_accessor :remember_token
    before_save { self.username = username.downcase }
    validates :username, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 6}, allow_blank: true

    has_secure_password
    has_secure_password :recovery_password, validations: false

    def User.digest(string)    
        cost = ActiveModel::SecurePassword.min_cost ?            
        BCrypt::Engine::MIN_COST :           
        BCrypt::Engine.cost    
        BCrypt::Password.create(string, cost: cost)  
    end

    def feed    
        Micropost.where("user_id = ?", id)  
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token    
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)    
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)  
    end

    def forget    
        update_attribute(:remember_digest, nil)  
    end

end
