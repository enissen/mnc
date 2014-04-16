class ImpressesController < ApplicationController
  before_action :set_impress, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @impress = Impress.first
  end

  def new
    @impress = Impress.new
  end

  def edit
  end

  def create
    @impress = Impress.new(impress_params)

    respond_to do |format|
      if @impress.save
        format.html { redirect_to @impress, notice: 'Impress was successfully created.' }
        format.json { render action: 'show', status: :created, location: @impress }
      else
        format.html { render action: 'new' }
        format.json { render json: @impress.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @impress.update(impress_params)
        format.html { redirect_to @impress, notice: 'Impress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @impress.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @impress.destroy
    respond_to do |format|
      format.html { redirect_to impresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impress
      @impress = Impress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impress_params
      params.require(:impress).permit(:title, :content)
    end
end
