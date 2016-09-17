class ConfigElementsController < ApplicationController
  before_action :set_config_element, only: [:show, :edit, :update, :destroy]

  # GET /config_elements
  # GET /config_elements.json
  def index
    @config_elements = ConfigElement.all
  end

  # GET /config_elements/1
  # GET /config_elements/1.json
  def show
  end

  # GET /config_elements/new
  def new
    @config_element = ConfigElement.new
  end

  # GET /config_elements/1/edit
  def edit
  end

  # POST /config_elements
  # POST /config_elements.json
  def create
    @config_element = ConfigElement.new(config_element_params)

    respond_to do |format|
      if @config_element.save
        format.html { redirect_to @config_element, notice: 'Config element was successfully created.' }
        format.json { render :show, status: :created, location: @config_element }
      else
        format.html { render :new }
        format.json { render json: @config_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_elements/1
  # PATCH/PUT /config_elements/1.json
  def update
    respond_to do |format|
      if @config_element.update(config_element_params)
        format.html { redirect_to @config_element, notice: 'Config element was successfully updated.' }
        format.json { render :show, status: :ok, location: @config_element }
      else
        format.html { render :edit }
        format.json { render json: @config_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_elements/1
  # DELETE /config_elements/1.json
  def destroy
    @config_element.destroy
    respond_to do |format|
      format.html { redirect_to config_elements_url, notice: 'Config element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_element
      @config_element = ConfigElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_element_params
      params.require(:config_element).permit(:key, :value)
    end
end
