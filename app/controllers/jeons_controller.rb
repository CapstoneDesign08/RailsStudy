class JeonsController < ApplicationController
  before_action :set_jeon, only: [:show, :edit, :update, :destroy]

  # GET /jeons
  # GET /jeons.json
  def index
    @jeons = Jeon.all
  end

  # GET /jeons/1
  # GET /jeons/1.json
  def show
  end

  # GET /jeons/new
  def new
    @jeon = Jeon.new
  end

  # GET /jeons/1/edit
  def edit
  end

  # POST /jeons
  # POST /jeons.json
  def create
    @jeon = Jeon.new(jeon_params)

    respond_to do |format|
      if @jeon.save
        format.html { redirect_to @jeon, notice: 'Jeon was successfully created.' }
        format.json { render :show, status: :created, location: @jeon }
      else
        format.html { render :new }
        format.json { render json: @jeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jeons/1
  # PATCH/PUT /jeons/1.json
  def update
    respond_to do |format|
      if @jeon.update(jeon_params)
        format.html { redirect_to @jeon, notice: 'Jeon was successfully updated.' }
        format.json { render :show, status: :ok, location: @jeon }
      else
        format.html { render :edit }
        format.json { render json: @jeon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jeons/1
  # DELETE /jeons/1.json
  def destroy
    @jeon.destroy
    respond_to do |format|
      format.html { redirect_to jeons_url, notice: 'Jeon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jeon
      @jeon = Jeon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jeon_params
      params.require(:jeon).permit(:name, :title, :content, :image)
    end
end
