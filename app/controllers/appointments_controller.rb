class AppointmentsController < ApplicationController
  def new
    pet_id = params[:pet_id]
    @pet = Pet.find pet_id
    @appointment = Appointment.new
  end

  def create
    appt_params = params.require(:appointment).permit(:name, :reason, :time)
    pet = Pet.find(params[:pet_id])
    new_appt = Appointment.new(appt_params)
    if new_appt.save
      pet.appointments << new_appt
      redirect_to pet_path(pet)
    else
      flash[:error] = new_appt.errors.full_messages.join(", ")
      render :new
    end
  end
end
