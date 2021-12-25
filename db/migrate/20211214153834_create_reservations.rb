class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string "menu", null: false
      t.boolean "treatment", default: false
      t.string "name", null: false
      t.datetime "start_date", null: false
      t.datetime "end_date"
      t.string "userinfo", null: false
      t.boolean "check", default: false

      t.timestamps
    end
  end
end
