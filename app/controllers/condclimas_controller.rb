class CondclimasController < ApplicationController
  before_action :set_condclima, only: [:show, :edit, :update, :destroy]

  # GET /condclimas
  # GET /condclimas.json
  def index
    @condclimas = Condclima.all
  end

  # GET /condclimas/1
  # GET /condclimas/1.json
  def show
  end

  # GET /condclimas/new
  def new
    @condclima = Condclima.new
  end

  # GET /condclimas/1/edit
  def edit
  end

  # POST /condclimas
  # POST /condclimas.json
  def create
    @condclima = Condclima.new(condclima_params)

    respond_to do |format|
      if @condclima.save
        format.html { redirect_to @condclima, notice: 'Condclima was successfully created.' }
        format.json { render :show, status: :created, location: @condclima }
      else
        format.html { render :new }
        format.json { render json: @condclima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condclimas/1
  # PATCH/PUT /condclimas/1.json
  def update
    respond_to do |format|
      if @condclima.update(condclima_params)
        format.html { redirect_to @condclima, notice: 'Condclima was successfully updated.' }
        format.json { render :show, status: :ok, location: @condclima }
      else
        format.html { render :edit }
        format.json { render json: @condclima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condclimas/1
  # DELETE /condclimas/1.json
  def destroy
    @condclima.destroy
    respond_to do |format|
      format.html { redirect_to condclimas_url, notice: 'Condclima was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condclima
      @condclima = Condclima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condclima_params
      params.require(:condclima).permit(:zona_id, :nombre, :temp, :viento, :hielo)
    end
end
