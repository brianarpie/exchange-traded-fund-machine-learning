class HoldingController < ApplicationController
  def prices
    @id = params[:id] || 0
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    respond_to do |format|
      format.json { 
        data = Holding.where(id: @id)
        render json: data
      }
    end
  end
end
