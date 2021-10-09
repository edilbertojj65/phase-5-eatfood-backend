class Review < ApplicationRecord
  belongs_to :photo
  belongs_to :group_user 
end
