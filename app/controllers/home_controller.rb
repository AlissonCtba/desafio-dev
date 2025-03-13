class HomeController < ApplicationController
  before_action :redirect_if_logged_in, only: [:index]

  def index
    # A home agora só será acessada por usuários não logados
  end

  private

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to cnab_uploads_path
    end
  end
end
