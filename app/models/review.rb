class Review < ApplicationRecord
  belongs_to :photo
  belongs_to :group_user 

  validates :comment ,  presence: true
  validates :rating , numericality: { only_integer: true }
  validates :photo_id , presence: true
  validates :group_user_id , presence: true
end
