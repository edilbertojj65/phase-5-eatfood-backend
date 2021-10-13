class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :namePhoto, :url, :fileName, :user_id, :group_user_id
  has_many   :review
end
