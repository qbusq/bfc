class AddCountryToOffer < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :country, :string
  end
end
