class PokemonSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :n_dex, :name
end
