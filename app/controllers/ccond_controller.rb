class CcondController < ApplicationController
  def new
  	@conds = Conductor.all
    @zonas = Zona.all.order(:id)
    @vano = Vano.new
  end

  def create
  	@vano = Vano.new
  	@result = @vano.calcvano(params[:zona_id].to_i, params[:conductor_id].to_i, params[:vano].to_f, params[:hconductor].to_f,0)
  	
  end
end
