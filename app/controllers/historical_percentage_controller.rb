class HistoricalPercentageController < ApplicationController
  before_action :set_historical_percentage, only: [:update, :destroy]

  # GET /api/historical_percentage.json
  def index
    etf_symbol = params[:etf_symbol]
    holding_symbol = params[:holding_symbol]
    start_date = params[:start_date]
    end_date = params[:end_date]

    respond_to do |format|
      begin
        holding_id = Holding.where('name = ?', holding_symbol).first.id
        etf_id = Etf.where('name = ?', etf_symbol).first.id
        etf_holding = EtfHolding.where('holding_id = ? AND etf_id = ?', holding_id, etf_id).first
        historical_percentages = etf_holding.historical_percentages
        
        if start_date && end_date
          historical_percentages = historical_percentages.where(percentage_date: start_date..end_date)
        end
        
        format.json { render json: historical_percentages }
      rescue
        # TODO: throw an error here?
        format.json { render plain: "Please specify a symbol for etf and holding.", status: :unprocessable_entity }
      end
    end
  end

  # POST /api/historical_percentage.json
  def create
    @historical_percentage = HistoricalPercentage.new(historical_percentage_params)

    respond_to do |format|
      if @historical_percentage.save
        format.json { render json: @historical_percentage, status: :created }
      else
        format.json { render json: @historical_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/historical_percentage/:id.json
  def update
    respond_to do |format|
      if @historical_percentage.update(historical_percentage_params)
        format.json { render json: @historical_percentage, status: :ok }
      else
        format.json { render json: @historical_percentage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/historical_percentage/:id.json
  def destroy
    @historical_percentage.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_historical_percentage
    @historical_percentage = HistoricalPercentage.find(params[:id])
  end

  def historical_percentage_params
    params.require(:historical_percentage).permit(:etf_holding_id, :percentage_date)
  end

end
