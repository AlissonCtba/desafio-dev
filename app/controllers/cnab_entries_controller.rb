class CnabEntriesController < ApplicationController
  # GET /cnab_entries or /cnab_entries.json
  def index
    @cnab_entries = CnabEntry.all
  end
end
