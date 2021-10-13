class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :namePhoto, :url, :fileName
  has_many   :review
end
