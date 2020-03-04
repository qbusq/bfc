class AddFollowUpToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :follow_up_on_offer, :integer
  end
end
