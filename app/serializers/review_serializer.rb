class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rating, :photo_id, :group_user_id
  belongs_to :photo
end
