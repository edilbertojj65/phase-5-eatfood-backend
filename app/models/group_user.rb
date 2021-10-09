class GroupUser < ApplicationRecord
  # belongs_to :user
  belongs_to :group, class_name: "Group", optional: true
  has_many :photo , dependent: :destroy
  has_many :review , dependent: :destroy 
end
