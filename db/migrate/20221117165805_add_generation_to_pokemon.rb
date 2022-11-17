class AddGenerationToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :generation, :integer
  end
end
