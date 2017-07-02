class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.order "appt_time DESC"
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new appt_params
    if @appointment.save
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  def appt_params
    params.require(:appointment).permit :title, :appt_time
  end
end
