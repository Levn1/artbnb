class AddCoordinatesToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :latitude, :float
    add_column :pieces, :longitude, :float
  end
end
