class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.order(:pokedex_number)
  end

  def toggle_captured
    @pokemon = Pokemon.find(params[:id])
    @pokemon.toggle_captured!

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace("pokemon_#{@pokemon.id}", partial: "pokemons/pokemon", locals: { pkm: @pokemon })
      }
      format.json { render json: { captured: @pokemon.captured } }
    end
  end
end