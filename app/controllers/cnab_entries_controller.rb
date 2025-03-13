class CnabEntriesController < ApplicationController
  before_action :set_cnab_upload, only: %i[ show edit update destroy ]

  # GET /cnab_entries or /cnab_entries.json
  def index
    @cnab_entries = CnabEntry.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cnab_upload
      @cnab_upload = CnabUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cnab_upload_params
      params.require(:cnab_upload).permit(:file_name, :created_at)
    end
end
