class HoldingController < ApplicationController
  before_action :set_holding, only: [:show, :edit, :update, :destroy]

  # GET /api/holding.json
  def index
    respond_to do |format|
      format.json {
        render json: Holding.all
      }
    end
  end

  # POST /api/holding.json
  def create
    @holding = Holding.new(holding_params)

    respond_to do |format|
      if @holding.save
        format.json { render json: @holding, status: :created }
      else
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/holding/:id.json
  def update
    respond_to do |format|
      if @holding.update(holding_params)
        format.json { render json: @holding, status: :ok }
      else
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/holding/:id.json
  def destroy
    @holding.destroy 
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # GET /api/holding/:id.json
  def show
    respond_to do |format|
      format.json {
        render json: @holding
      }
    end
  end

  private

  def set_holding
    @holding = Holding.find(params[:id])
  end

  def holding_params
    params.require(:holding).permit(:name)
  end

end
