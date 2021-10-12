class Group < ApplicationRecord
  belongs_to :user
  has_many :group_user ,dependent: :destroy

  validates :name, presence: true
  validates :typeName , presence: true
  validates :user_id , presence: true
end
