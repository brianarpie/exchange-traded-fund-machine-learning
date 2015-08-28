class EtfHoldingController < ApplicationController
  before_action :set_etf_holding, only: [:show, :update, :destroy]

   # GET /api/etf_holding.json
  def index
    respond_to do |format|
      format.json {
        render json: EtfHolding.all
      }
    end
  end

  # POST /api/etf_holding.json
  def create
    @etf_holding = EtfHolding.new(etf_holding_params)

    respond_to do |format|
      if @etf_holding.save
        format.json { render json: @etf_holding, status: :created }
      else
        format.json { render json: @etf_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/etf_holding/:id.json
  def update
    respond_to do |format|
      if @etf_holding.update(etf_holding_params)
        format.json { render json: @etf_holding, status: :ok }
      else
        format.json { render json: @etf_holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/etf_holding/:id.json
  def destroy
    @etf_holding.destroy 
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /api/etf_holding/:id.json
  def show
    respond_to do |format|
      format.json {
        render json: @etf_holding
      }
    end
  end

  private

  def set_etf_holding
    @etf_holding = EtfHolding.find(params[:id])
  end

  def etf_holding_params
    params.require(:etf_holding).permit(:etf_id, :holding_id)
  end
end
