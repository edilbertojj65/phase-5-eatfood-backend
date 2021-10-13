class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :typeName, :user_id
end
