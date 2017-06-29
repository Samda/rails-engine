class Api::V1::Merchants::MostRevenueController < ApplicationController
  include Swagger::Docs::Methods

  swagger_controller :merchants_most_revenue, 'Merchants Most Revenue Controller'

  swagger_api :index do
    summary "Fetches merchants ranked by most revenue"
    notes "This returns the merchants listed by total revenue, can be limited in quantity"
    param :query, :date, :string, :optional, "quantity"
  end

  def index
    return render json: Merchant.total_revenue(params[:quantity])
  end
end