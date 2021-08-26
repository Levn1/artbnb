class BookingsController < ApplicationController
  def new
    @piece = Piece.find(params[:piece_id])
    @booking = Booking.new
    authorize @piece
  end

  def create
    @booking = Booking.new(booking_params)
    @piece = Piece.find(params[:piece_id])
    @booking.piece = @piece
    @booking.user = current_user
    authorize @piece
    @booking.save
    redirect_to piece_path(@piece)
  end

  private

  def booking_params
    params.require(:booking).permit(:content)
  end
end
