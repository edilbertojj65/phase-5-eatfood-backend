class Photo < ApplicationRecord
  belongs_to :review ,  class_name: "Review", optional: true
  belongs_to :group_user
  has_many   :review , dependent: :destroy

  validates :namePhoto, presence: true
  validates :url, presence: true
  validates :fileName , presence: true
  validates :user_id , presence: true
end 
