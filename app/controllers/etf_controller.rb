class EtfController < ApplicationController
  before_action :set_etf, only: [:show, :edit, :update, :destroy]

  # GET /api/etf.json
  def index
    respond_to do |format|
      format.json {
        render json: Etf.all
      }
    end
  end

  # POST /api/etf.json
  def create
    @etf = Etf.new({name: params[:name]})

    respond_to do |format|
      if @etf.save
        format.json { render json: @etf, status: :created }
      else
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/etf/:id.json
  def update
    respond_to do |format|
      if @etf.update(etf_params)
        format.json { render json: @etf, status: :ok }
      else
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/etf/:id.json
  def destroy
    @etf.destroy 
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /api/etf/:id.json
  def show
    respond_to do |format|
      format.json {
        render json: @etf
      }
    end
  end

  private

  def set_etf
    @etf = Etf.find(params[:id])
  end

  def etf_params
    params.require(:etf).permit(:name)
  end

  def filter_by_date
    @prices.where(price_date: @start_date..@end_date)
  end
end
