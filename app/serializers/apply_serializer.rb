class ApplySerializer < ActiveModel::Serializer
  attributes :read, :invited
  has_one :job
  has_one :geek
end
