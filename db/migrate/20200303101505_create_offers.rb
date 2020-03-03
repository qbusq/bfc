class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.date :date
      t.date :start_date
      t.date :end_date
      t.string :remark
      t.string :status

      t.timestamps
    end
  end
end
