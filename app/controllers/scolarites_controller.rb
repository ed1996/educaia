class ScolaritesController < ApplicationController

  before_action :set_scolarite, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @scolarites = current_user.scolarites
  end

  def show
    @scolarite = current_user.scolarites.build
  end

  def create
    @scolarite = current_user.scolarites.build(scolarite_params)
    if @scolarite.save
      redirect_to @scolarite, notice:"Votre scolarite a été ajoutée avec succés"
    else
      render :new
    end
  end

  def new
    @scolarite = current_user.scolarites.build
  end

  def edit

  end

  def update
    if @scolarite.update(scolarite_params)
      redirect_to @scolarite, notice:"Modification enregistrée..."
    else
      render :edit
    end
  end

  private
  def set_scolarite
    @scolarite = Scolarite.find(params[:id])
  end

  def scolarite_params
    params.require(:scolarite).permit(:filiere, :francais, :philosophie, :histoiregeo, :lv1, :lv2, :eps, :mathematique, :physiquechimie, :svt, :ses, :spemath, :spesvt, :spephysique, :tpe, :lv3)
  end

end
