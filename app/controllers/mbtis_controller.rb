class MbtisController < ApplicationController

  before_action :set_mbti, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @mbtis = current_user.mbtis
  end

  def show
    @mbti = current_user.mbtis.build
  end

  def create
    @mbti = current_user.mbtis.build(mbti_params)
    if @mbti.save
      redirect_to @mbti, notice:"Votre mbti a été ajoutée avec succés"
    else
      render :new
    end
  end

  def new
    @mbti = current_user.mbtis.build
  end

  def edit

  end

  def update
    if @mbti.update(mbti_params)
      redirect_to @mbti, notice:"Modification enregistrée..."
    else
      render :edit
    end
  end

  private
  def set_mbti
    @mbti = Mbti.find(params[:id])
  end

  def mbti_params
    params.require(:mbti).permit(:question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10)
  end


end
