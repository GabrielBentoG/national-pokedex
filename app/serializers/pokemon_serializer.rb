class PokemonSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :generation, :n_dex, :name, :types

  attribute :types do |object|
    {
      type: object.types.map{|t| {name: t.name} }
    }
    
end
