class User < ActiveRecord::Base
   has_many :project

   validates :firstname, presence: { message: "must be given please" }
   validates :lastname, presence: {message: "not be blank"}
   
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, :uniqueness => { :case_sensitive => false }
   
  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
   /x

validates :password, 
  presence: true, 
  format: {with: PASSWORD_FORMAT}, 
  confirmation: true, 
  on: :create 
 
 has_secure_password
 end
