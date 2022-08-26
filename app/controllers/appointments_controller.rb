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

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(appointment_params)
    @appointment.save!
  end

  def destroy
  end

  def index
    @appointments = Appointment.all
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :hours)
  end

end
