class CnabUploadsController < ApplicationController
  before_action :set_cnab_upload, only: %i[ show edit update destroy ]

  # GET /cnab_uploads or /cnab_uploads.json
  def index
    @cnab_uploads = CnabUpload.all
  end

  # GET /cnab_uploads/1 or /cnab_uploads/1.json
  def show
    @cnab_entries = @cnab_upload.cnab_entries
  end

  # GET /cnab_uploads/new
  def new
    @cnab_upload = CnabUpload.new
  end

  # GET /cnab_uploads/1/edit
  def edit
  end

  # POST /cnab_uploads or /cnab_uploads.json
  def create
    @cnab_upload = CnabUpload.new(cnab_upload_params)

    respond_to do |format|
      if @cnab_upload.save        
        # Colocar no SIDEKIQ
        process_cnab_file(params[:cnab_upload][:file], @cnab_upload.id) if params[:cnab_upload][:file].present?

        format.html { redirect_to @cnab_upload, notice: "Cnab upload was successfully created." }
        format.json { render :show, status: :created, location: @cnab_upload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cnab_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cnab_uploads/1 or /cnab_uploads/1.json
  def update
    respond_to do |format|
      if @cnab_upload.update(cnab_upload_params)
        format.html { redirect_to @cnab_upload, notice: "Cnab upload was successfully updated." }
        format.json { render :show, status: :ok, location: @cnab_upload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cnab_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cnab_uploads/1 or /cnab_uploads/1.json
  def destroy
    @cnab_upload.destroy!

    respond_to do |format|
      format.html { redirect_to cnab_uploads_path, status: :see_other, notice: "Cnab upload was successfully destroyed." }
      format.json { head :no_content }
    end
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

    def process_cnab_file(uploaded_file, cnab_upload_id)
      file_content = uploaded_file.read
  
      file_content.each_line do |line|
        # Extrai os dados de cada linha com base nas posições definidas
        transaction_type_id = line[0, 1]        # Tipo da transação
        date = line[1, 8]                       # Data da ocorrência
        value = line[9, 10].to_i / 100.0        # Valor da movimentação (divido por 100 para normalizar)
        cpf = line[19, 11]                      # CPF do beneficiário
        card = line[30, 12]                     # Cartão utilizado
        hour = line[42, 6]                      # Hora da ocorrência
        store_owner = line[48, 14].strip        # Dono da loja (nome do representante)
        store_name = line[62, 19].strip         # Nome da loja
  
        CnabEntry.create!(
          cnab_upload_id: cnab_upload_id,
          transaction_type_id: transaction_type_id.to_i, 
          date: Date.parse(date),
          value: value,
          cpf: cpf.strip,
          card: card.strip,
          time: hour.strip,
          store_owner: store_owner,
          store_name: store_name
        )
      end
    end
end
