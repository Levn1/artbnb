class BookingsController < ApplicationController
  def new
    authorize @booking
    @piece = Piece.find(params[:piece_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @piece = Piece.find(params[:piece_id])
    @booking.piece = @piece
    @booking.save
    redirect_to piece_path(@piece)
  end

  private

  def booking_params
    params.require(:booking).permit(:content)
  end
end
