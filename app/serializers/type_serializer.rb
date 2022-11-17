class TypeSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :name, :description
end
