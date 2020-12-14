module Api 
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]

      # GET /todos
      def index
        @todos = current_user.todos

        render json: @todos
      end

      # GET /todos/1
      def show
        render json: @todo
      end

      # POST /todos
      def create
        @todo = current_user.todos.new(todo_params)

        if @todo.save
          render json: @todo, status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      def update
        if @todo.update(todo_params)
          render json: @todo
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      def destroy
        if @todo
          @todo.destroy
          render json: {message: "Todo deleted succesfully!"}, status: :ok
        else
          render json: {message: "Unable to Todo!"}, status: :bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_todo
          @todo = Todo.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def todo_params
          params.require(:todo).permit(:title, :description, :deadline, :completed, :user_id)
        end
    end
  end
end