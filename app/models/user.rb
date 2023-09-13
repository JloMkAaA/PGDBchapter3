class User < ApplicationRecord
    attr_accessor :username, :password

    def Initialize(attributes = {})
        @username = attributes(:username)
        @password = attributes(:password)
    end
    
    def getUsername
        "#{@username}"
    end
end
