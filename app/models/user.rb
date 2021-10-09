class User < ApplicationRecord
    has_many :group ,dependent: :destroy
    has_many :photo ,dependent: :destroy
    
    validates :name, presence: true
    validates :email, presence: true
    validates :dateObird , presence: true
   
end
