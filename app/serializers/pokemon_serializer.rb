class PokemonSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :generation, :n_dex, :name
end
