class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.date :date
      t.date :start_date
      t.date :end_date
      t.string :remark
      t.string :status
      t.bigint :from_user_id, index: true
      t.bigint :to_user_id, index: true
      t.bigint :offer_request_id, index: true
      t.bigint :follow_up_on_offer_id, index: true

      t.timestamps
    end
  end
end
