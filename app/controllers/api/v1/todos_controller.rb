module Api 
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]

      # GET /todos
      def index
        @todos = current_user.todos

        render json: TodoSerializer.new(@todos, options).serialized_json
      end

      # GET /todos/1
      def show
        render json: TodoSerializer.new(@todo, options).serialized_json
      end

      # POST /todos
      def create
        @todo = current_user.todos.new(todo_params)

        if @todo.save
          render json: TodoSerializer.new(@todo).serialized_json, status: :created
        else
          render json: @todo.errors.messages, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      def update
        if @todo.update(todo_params)
          render json: TodoSerializer.new(@todo, options).serialized_json
        else
          render json: @todo.errors.messages, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      def destroy
        if @todo
          @todo.destroy
          render json: { message: "Todo deleted succesfully!" }, status: :ok
        else
          render json: { message: "Unable to delete Todo!" }, status: :bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_todo
          @todo = Todo.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def todo_params
          params.permit(:title, :description, :deadline, :completed, :tags)
        end

        def options
          @options ||= {include: %i[subtodos]}
        end
    end
  end
end