class ProfilPsychosController < ApplicationController

  def index
    @scolarites = Scolarite.all
    render json: @scolarites
  end

end
