class ImportCnabJob < ApplicationJob
  queue_as :default

  def perform(file_path, cnab_upload_id)
    file = File.open(file_path)

    cnab_upload = CnabUpload.find(cnab_upload_id)
    cnab_upload.process_cnab_file(file)

    file.close
  end
end
