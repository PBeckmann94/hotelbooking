require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit bookings_url
    click_on "New booking"

    fill_in "Arrival date", with: @booking.arrival_date
    fill_in "Departure date", with: @booking.departure_date
    fill_in "Email", with: @booking.email
    fill_in "First name", with: @booking.first_name
    fill_in "Hotel", with: @booking.hotel_id
    fill_in "Last name", with: @booking.last_name
    fill_in "Number of rooms", with: @booking.number_of_rooms
    fill_in "Phone", with: @booking.phone
    fill_in "Price", with: @booking.price
    fill_in "String", with: @booking.string
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit booking_url(@booking)
    click_on "Edit this booking", match: :first

    fill_in "Arrival date", with: @booking.arrival_date
    fill_in "Departure date", with: @booking.departure_date
    fill_in "Email", with: @booking.email
    fill_in "First name", with: @booking.first_name
    fill_in "Hotel", with: @booking.hotel_id
    fill_in "Last name", with: @booking.last_name
    fill_in "Number of rooms", with: @booking.number_of_rooms
    fill_in "Phone", with: @booking.phone
    fill_in "Price", with: @booking.price
    fill_in "String", with: @booking.string
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit booking_url(@booking)
    click_on "Destroy this booking", match: :first

    assert_text "Booking was successfully destroyed"
  end
end
