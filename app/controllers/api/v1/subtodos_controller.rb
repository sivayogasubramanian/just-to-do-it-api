module Api 
  module V1

    class SubtodosController < ApplicationController
      before_action :set_subtodo, only: [:show, :update, :destroy]

      # GET /subtodos
      def index
        @subtodos = Subtodo.all

        render json: @subtodos
      end

      # GET /subtodos/1
      def show
        render json: @subtodo
      end

      # POST /subtodos
      def create
        @subtodo = Subtodo.new(subtodo_params)

        if @subtodo.save
          render json: @subtodo, status: :created, location: @subtodo
        else
          render json: @subtodo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /subtodos/1
      def update
        if @subtodo.update(subtodo_params)
          render json: @subtodo
        else
          render json: @subtodo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /subtodos/1
      def destroy
        @subtodo.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_subtodo
          @subtodo = Subtodo.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def subtodo_params
          params.fetch(:subtodo, {})
        end
    end
  end
end