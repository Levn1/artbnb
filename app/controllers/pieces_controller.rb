class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]

  # GET /pieces
  def index
    @pieces = policy_scope(Piece)
  end

  # GET /pieces/1
  def show
    authorize @piece
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
    authorize @piece
  end

  # GET /pieces/1/edit
  def edit
    authorize @piece
  end

  # POST /pieces
  def create
    @piece = Piece.new(piece_params)
    @piece.user = current_user
    authorize @piece

    if @piece.save
      redirect_to @piece, notice: 'piece was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pieces/1
  def update
    authorize @piece
    if @piece.update(piece_params)
      redirect_to @piece, notice: 'piece was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pieces/1
  def destroy
    authorize @piece
    @piece.destroy
    redirect_to pieces_url, notice: 'piece was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_piece
    @piece = Piece.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def piece_params
      params.require(:piece).permit(:name, :height, :length, :price, :category, :artist, :description, :user_id, :photo)
    end
end
