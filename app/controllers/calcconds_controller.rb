class CalccondsController < ApplicationController
  before_action :set_calccond, only: [:show, :edit, :update, :destroy]

  # GET /calcconds
  # GET /calcconds.json
  def index
    @calcconds = Calccond.all
  end

  # GET /calcconds/1
  # GET /calcconds/1.json
  def show
  end

  # GET /calcconds/new
  def new
    @calccond = Calccond.new
  end

  # GET /calcconds/1/edit
  def edit
  end

  # POST /calcconds
  # POST /calcconds.json
  def create
    @calccond = Calccond.new(calccond_params)

    respond_to do |format|
      if @calccond.save
        format.html { redirect_to @calccond, notice: 'Calccond was successfully created.' }
        format.json { render :show, status: :created, location: @calccond }
      else
        format.html { render :new }
        format.json { render json: @calccond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calcconds/1
  # PATCH/PUT /calcconds/1.json
  def update
    respond_to do |format|
      if @calccond.update(calccond_params)
        format.html { redirect_to @calccond, notice: 'Calccond was successfully updated.' }
        format.json { render :show, status: :ok, location: @calccond }
      else
        format.html { render :edit }
        format.json { render json: @calccond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calcconds/1
  # DELETE /calcconds/1.json
  def destroy
    @calccond.destroy
    respond_to do |format|
      format.html { redirect_to calcconds_url, notice: 'Calccond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calccond
      @calccond = Calccond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calccond_params
      params.require(:calccond).permit(:vano_id, :condclima_id, :temp, :viento, :hielo, :tension, :tiro, :flecha_t, :flecha_v, :flecha_h)
    end
end
