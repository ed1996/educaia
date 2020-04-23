module Api
  module V1
    class ScolaritesController < ApplicationController
      def index
        @scolarites = Scolarite.all
        render json: @scolarites
      end
    end
  end
end