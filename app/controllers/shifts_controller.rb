class ShiftsController < ApplicationController

  # GET /shifts
  def index
    shifts = Shift.all()
    render json: { status: 200,
                   shifts: shifts }
  end

  # POST /shifts
  def create
    shift = Shift.create!(params)
    byebug
    render json: { status: 200,
                  shift: shift }
  end

  # GET /shifts/:id
  def show
    shift = Shift.find(params[:id])
    render json: { status: 200,
                   shift: shift }
  end

  # PUT /shifts/:id

  # DELETE /shifts/:id
end
