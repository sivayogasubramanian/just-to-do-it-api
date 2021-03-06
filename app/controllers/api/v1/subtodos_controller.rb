module Api 
  module V1
    class SubtodosController < ApplicationController
      before_action :set_todo
      before_action :set_subtodo, only: [:show, :update, :destroy]

      # GET /subtodos
      def index
        @subtodos = @todo.subtodos

        render json: SubtodoSerializer.new(@subtodos).serialized_json
      end

      # GET /subtodos/1
      def show
        render json: SubtodoSerializer.new(@subtodo).serialized_json
      end

      # POST /subtodos
      def create
        @subtodo = @todo.subtodos.new(subtodo_params)

        if @subtodo.save
          render json: SubtodoSerializer.new(@subtodo).serialized_json, status: :created
        else
          render json: @subtodo.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /subtodos/1
      def update
        if @subtodo.update(subtodo_params)
          render json: SubtodoSerializer.new(@subtodo).serialized_json
        else
          render json: @subtodo.errors.full_messages, status: :unprocessable_entity
        end
      end

      # DELETE /subtodos/1
      def destroy
        if @subtodo
          @subtodo.destroy
          render json: { message: "Subtodo deleted succesfully!" }, status: :ok
        else
          render json: { message: "Unable to delete Subtodo!" }, status: :bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_todo
          @todo = Todo.find(params[:todo_id])
        end

        def set_subtodo
          @subtodo = Subtodo.find(params[:id]) if @todo
        end

        # Only allow a list of trusted parameters through.
        def subtodo_params
          params.permit(:title, :completed, :todo_id)
        end
    end
  end
end