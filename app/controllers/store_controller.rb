class StoreController < ApplicationController

  def index
    @hotels = Hotel.order(:name)
  end
  
end
