class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.offer = @offer

    if @appointment.save
      redirect_to user_path(current_user), notice: "Appointment was successfully booked."
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
