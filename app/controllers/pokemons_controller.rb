class PokemonsController < ApplicationController
  include ErrorSerializer

  before_action :set_pokemon, only: [:show, :update, :destroy]

  #GET /pokemons
  def index
    @pokemons = Pokemon.all

    render json: PokemonSerializer.new(@pokemons).serialized_json

  end

  #GET /pokemons/:id
  def show
    render json: PokemonSerializer.new(@pokemon).serialized_json
  end

  #POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: PokemonSerializer.new(@pokemon).serialized_json, status: :created
    else
      render json: ErrorSerializer.serialize(pokemon.errors), status: :unprocessable_entity
    end
  end

  def update
    def update
      if @pokemon.update(pokemon_params)
        render json: PokemonSerializer.new(@pokemon).serialized_json
      else
        render json: ErrorSerializer.serialize(@pokemon.errors), status: :unprocessable_entity
      end
    end
  end

  def delete
    @pokemon.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pokemon_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
