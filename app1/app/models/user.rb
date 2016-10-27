class User < ActiveRecord::Base
   attr_accessor :password_salt
   before_save :encrypt_password
  
 def encrypt_password
    if @Password.present?
      password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
