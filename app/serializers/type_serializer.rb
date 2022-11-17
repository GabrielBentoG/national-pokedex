class TypeSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :name, :description, :pokemons

  attribute :pokemons do |object|
    {
      type: object.pokemons.map{|t| {n_dex: t.n_dex, name: t.name} }
    }
  end 
end
