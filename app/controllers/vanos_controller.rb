class VanosController < ApplicationController
  before_action :set_vano, only: [:show, :edit, :update, :destroy]

  # GET /vanos
  # GET /vanos.json
  def index
    @vanos = Vano.all
  end

  # GET /vanos/1
  # GET /vanos/1.json
  def show
  end

  # GET /vanos/new
  def new
    @conds = Conductor.all
    @zonas = Zona.all
    @vano = Vano.new
  end

  # GET /vanos/1/edit
  def edit
    @conds = Conductor.all
    @zonas = Zona.all
  end

  # POST /vanos
  # POST /vanos.json
  def create
    @vano = Vano.new(vano_params)
    byebug

    respond_to do |format|
      if @vano.save
        format.html { redirect_to @vano, notice: 'Vano was successfully created.' }
        format.json { render :show, status: :created, location: @vano }
      else
        format.html { render :new }
        format.json { render json: @vano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vanos/1
  # PATCH/PUT /vanos/1.json
  def update
    byebug
    respond_to do |format|
      if @vano.update(vano_params)
        format.html { redirect_to @vano, notice: 'Vano was successfully updated.' }
        format.json { render :show, status: :ok, location: @vano }
      else
        format.html { render :edit }
        format.json { render json: @vano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vanos/1
  # DELETE /vanos/1.json
  def destroy
    @vano.destroy
    respond_to do |format|
      format.html { redirect_to vanos_url, notice: 'Vano was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vano
      @vano = Vano.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vano_params
      params.require(:vano).permit(:nombre, :proyecto_id, :conductor_id, :zona_id, :vano, :hconductor)
    end
end
