class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to current_user, notice: "Appointment was successfully booked."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :hours)
  end

end
