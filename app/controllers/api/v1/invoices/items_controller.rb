class Api::V1::Invoices::ItemsController < ApplicationController
  include Swagger::Docs::Methods
  
  swagger_controller :invoices, "Invoices Items Controller", resource_path: "invoices"

  swagger_api :index do
    summary "Fetches a collection of associated items"
    param :query, :id, :integer, :required, "id"

    response :not_found
  end

  def index
    render json: Invoice.find(params[:id]).items
  end
end
