class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :reason
      t.integer :name
      t.datetime :time

      t.timestamps
    end
  end
end
