class HoldingController < ApplicationController

  def prices
    @id = params[:id]
    @ticker_symbol = params[:ticker_symbol]

    @start_date = params[:start_date]
    @end_date = params[:end_date]

    holding = Holding.where('id = ? OR name = ?', @id, @ticker_symbol)
    @prices = holding[0].historical_prices

    @prices = @start_date && @end_date ? filter_by_date : @prices

    respond_to do |format|
      format.json {
        render json: @prices
      }
      format.any {
        render :status => 500
      }
    end
  end

  private

  def filter_by_date
    @prices.where(price_date: @start_date..@end_date)
  end

end
