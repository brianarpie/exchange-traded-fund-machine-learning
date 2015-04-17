class HistoricalPriceController < ApplicationController
  before_action :set_historical_price, only: [:update, :destroy]

  # GET /api/historical_price.json
  def index
    symbol = params[:symbol]
    start_date = params[:start_date]
    end_date = params[:end_date]

    respond_to do |format|
      begin
        holding = Holding.where('name = ?', symbol).first
        historical_prices = holding.historical_prices
        if start_date && end_date
          historical_prices = historical_prices.where(date: start_date..end_date) 
        end
        format.json { render json: historical_prices }
      rescue
        format.json { render plain: "Please specify a symbol.", status: :unprocessable_entity }
      end
    end
  end

  # POST /api/historical_price.json
  def create
    @historical_price = HistoricalPrice.new(historical_price_params)

    respond_to do |format|
      if @historical_price.save
        format.json { render json: @historical_price, status: :created }
      else
        format.json { render json: @historical_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/historical_price/:id.json
  def update
    respond_to do |format|
      if @historical_price.update(historical_price_params)
        format.json { render json: @historical_price, status: :ok }
      else
        format.json { render json: @historical_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/historical_price/:id.json
  def destroy
    @historical_price.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_historical_price
    @historical_price = HistoricalPrice.find(params[:id])
  end

  def historical_price_params
    params.require(:historical_price).permit(:date, :open, :close, :low, :high, :priceable_id, :priceable_type)
  end

end
