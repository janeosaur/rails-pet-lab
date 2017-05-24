class AddPetReferenceToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :pet, foreign_key: true
  end
end
