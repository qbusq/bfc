class AddTitleToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :title, :string
  end
end
