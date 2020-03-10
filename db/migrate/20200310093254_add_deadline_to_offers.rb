class AddDeadlineToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :deadline, :date
  end
end
