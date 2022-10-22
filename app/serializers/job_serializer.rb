include ActionController::Serialization

class JobSerializer < ActiveModel::Serializer
  attributes :name, :place, :created_at
  has_one :company
end

