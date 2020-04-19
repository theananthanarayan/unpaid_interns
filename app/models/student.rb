class Student < ActiveRecord::Base
    serialize :email, EncryptedCoder.new
    serialize :password, EncryptedCoder.new
    
end