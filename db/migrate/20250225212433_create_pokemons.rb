class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.integer :pokedex_number, null: false
      t.boolean :captured, default: false

      t.timestamps
    end

    add_index :pokemons, :pokedex_number
  end
end
