class BookingsController < ApplicationController
  before_action :set_hotel, only: [:new, :create]
  before_action :set_booking, only: %i[ show edit update destroy ]


  # GET /bookings or /bookings.json
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @bookings = @hotel.bookings.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @booking = @hotel.bookings.build
  end
  
  

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @booking = @hotel.bookings.new(booking_params)
  
    respond_to do |format|
      if @booking.save
        format.html { redirect_to hotel_bookings_path(@hotel, @booking), notice:, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:first_name, :last_name, :phone, :email, :hotel_id, :arrival_date, :departure_date, :number_of_rooms)
    end
end
