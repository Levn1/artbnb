class BookingsController < ApplicationController
  def new
    @piece = Piece.find(params[:piece_id])
    @booking = Booking.new
    @booking.piece = @piece
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @piece = Piece.find(params[:piece_id])
    @booking.piece = @piece
    @booking.user = current_user
    authorize @piece
    authorize @booking

    if @booking.save
      redirect_to piece_booking_path(@booking.id, @piece.id), notice: 'your booking has been sent!'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    start = @booking.date_start
    endd = @booking.date_end
    @total = (start-endd).to_i * -1
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
