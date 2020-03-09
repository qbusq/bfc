class RemoveCountryColumnToOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :country
  end
end
