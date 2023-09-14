class User < ApplicationRecord
    before_save { self.username = username.downcase }
    validates :username, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 6}

    has_secure_password
    has_secure_password :recovery_password, validations: false
end
