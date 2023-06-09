class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]

  # GET /hotels or /hotels.json
    def index
      @hotels = Hotel.all
      @available_rooms = {}
      @hotels.each do |hotel|
        booked_rooms = hotel.bookings.sum(:number_of_rooms)
        @available_rooms[hotel.id] = hotel.number_of_rooms - booked_rooms
      end
    end


  # GET /hotels/1 or /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @hotels = Hotel.all
  
    @hotels = @hotels.where(city: params[:city]) if params[:city].present?
    @hotels = @hotels.where('number_of_rooms >= ?', params[:number_of_rooms]) if params[:number_of_rooms].present?
    @hotels = @hotels.where('price <= ?', params[:price]) if params[:price].present?

    @available_rooms = {}
    @hotels.each do |hotel|
      booked_rooms = hotel.bookings.sum(:number_of_rooms)
      available_rooms = hotel.number_of_rooms - booked_rooms
      @available_rooms[hotel.id] = available_rooms if available_rooms > 0
    end
  
    @hotels = @hotels.where(id: @available_rooms.keys)

    @hotels = @hotels.order(price: :asc)

    render '/hotels/search_results'
  end
  
  
  
  
  def search_results
  end
  
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :city, :description, :image_url, :number_of_rooms, :price)
    end


