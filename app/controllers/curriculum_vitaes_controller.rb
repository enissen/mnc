class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @curriculum_vitae = CurriculumVitae.first
  end

  def show
  end

  def new
    @curriculum_vitae = CurriculumVitae.new
  end

  def edit
  end

  def create
    @curriculum_vitae = CurriculumVitae.new(curriculum_vitae_params)
    respond_to do |format|
      if @curriculum_vitae.save
        format.html { redirect_to @curriculum_vitae, notice: 'Curriculum vitae was successfully created.' }
        format.json { render action: 'show', status: :created, location: @curriculum_vitae }
      else
        format.html { render action: 'new' }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @curriculum_vitae.update(curriculum_vitae_params)
        format.html { redirect_to @curriculum_vitae, notice: 'Curriculum vitae was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @curriculum_vitae.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitaes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_vitae
      @curriculum_vitae = CurriculumVitae.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_vitae_params
      params.require(:curriculum_vitae).permit(:title, :content)
    end
end
