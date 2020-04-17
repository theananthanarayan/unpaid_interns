class Student < ActiveRecord::Base
    serialize :email, EncryptedCoder.new
    serialize :password, EncryptedCoder.new
    has_and_belongs_to_many :conversations, dependent: :destroy
end
    


