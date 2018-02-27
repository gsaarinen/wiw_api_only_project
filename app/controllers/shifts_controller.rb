class ShiftsController < ApplicationController
  def index
    shifts = Shift.all()
    render json: { status: 200,
                   shifts: shifts }
  end

  def show
    shift = Shift.first
    render json: { status: 200
                   shift: shift}
  end
end
