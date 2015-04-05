class ApplicationController < ActionController::Base
  skip_before_filter  :verify_authenticity_token
  
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session


  def etf_comparison
  end

  # before_action :set_historical_price, only: [:update, :destroy]

  # # GET /api/historical_price.json
  # def index
  # end

  # # POST /api/historical_price.json
  # def create
  # end

  # # PATCH/PUT /api/historical_price/:id.json
  # def update
  # end

  # # DELETE /api/historical_price/:id.json
  # def destroy
  # end

  # private

  # def set_historical_price
  #   @historical_price = HistoricalPrice.find(params[:id])
  # end

end
