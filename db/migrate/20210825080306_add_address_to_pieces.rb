class AddAddressToPieces < ActiveRecord::Migration[6.0]
  def change
    add_column :pieces, :address, :string
  end
end
