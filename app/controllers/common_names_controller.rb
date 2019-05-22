class CommonNamesController < ApplicationController
  before_action :set_common_name, only: [:show, :edit, :update, :destroy]

  # GET /common_names
  # GET /common_names.json
  def index
    @common_names = CommonName.all
  end

  # GET /common_names/1
  # GET /common_names/1.json
  def show
  end

  # GET /common_names/new
  def new
    @common_name = CommonName.new
  end

  # GET /common_names/1/edit
  def edit
  end

  # POST /common_names
  # POST /common_names.json
  def create
    @common_name = CommonName.new(common_name_params)

    respond_to do |format|
      if @common_name.save
        format.html { redirect_to @common_name, notice: 'Common name was successfully created.' }
        format.json { render :show, status: :created, location: @common_name }
      else
        format.html { render :new }
        format.json { render json: @common_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common_names/1
  # PATCH/PUT /common_names/1.json
  def update
    respond_to do |format|
      if @common_name.update(common_name_params)
        format.html { redirect_to @common_name, notice: 'Common name was successfully updated.' }
        format.json { render :show, status: :ok, location: @common_name }
      else
        format.html { render :edit }
        format.json { render json: @common_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common_names/1
  # DELETE /common_names/1.json
  def destroy
    @common_name.destroy
    respond_to do |format|
      format.html { redirect_to common_names_url, notice: 'Common name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_name
      @common_name = CommonName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def common_name_params
      params.require(:common_name).permit(:species_id, :name)
    end
end
