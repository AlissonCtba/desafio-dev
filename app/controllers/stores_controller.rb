class StoresController < ApplicationController
  before_action :set_store, only: %i[ show ]

  # GET /stores or /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1 or /stores/1.json
  def show
    @cnab_entries = @store.cnab_entries
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.permit(:name, :owner, :balance)
    end
end
