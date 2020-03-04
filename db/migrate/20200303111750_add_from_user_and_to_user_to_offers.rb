class AddFromUserAndToUserToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :from_user, :integer
    add_column :offers, :to_user, :integer
    add_column :offers, :offer_request_id, :integer
  end
end
