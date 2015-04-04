class HoldingController < ApplicationController

  def prices
    @id = params[:id]

    @start_date = params[:start_date]
    @end_date = params[:end_date]

    prices = Holding.find(@id).historical_prices

    if @start_date && @end_date
      @start_date = Date.parse @start_date
      @end_date = Date.parse @end_date
      prices = prices.where(price_date: @start_date..@end_date)
    end

    respond_to do |format|
      format.json {
        render json: prices
      }
      format.any {
        render :status => 500
      }
    end
  end

end
