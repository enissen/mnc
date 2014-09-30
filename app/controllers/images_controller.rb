class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        if image_params[:file].blank?
          format.html { redirect_to @image, notice: 'Image was successfully created.' }
          format.json { render action: 'show', status: :created, location: @image }
        else
          format.html { render action: 'crop' }
          format.json { render action: 'crop', status: :cropping }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        @image.update_positions params[:image][:gallery_position]
        if image_params[:file].blank?
          @image.reprocess_file(  params[:image][:crop_x],
                                  params[:image][:crop_y],
                                  params[:image][:crop_w],
                                  params[:image][:crop_h]) if params[:image][:crop_x].present?
          format.html { redirect_to @image, notice: 'Image was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'crop' }
          format.json { render action: 'crop', status: :cropping }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :material, :dimension, :description, :file, :gallery_ids => [], :crop_x => String, :crop_y => String, :crop_w => String, :crop_h => String)
    end
end
