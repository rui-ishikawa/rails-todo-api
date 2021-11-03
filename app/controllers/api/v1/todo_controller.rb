class Api::V1::TodoController < ApplicationController
    before_action :set_todo, only: %i[update, destroy]

    def index
        todos = Todo.all
        render json: {status: 200, todos: todos}
    end

    def create 
        todo = Todo.new(todo_params)
        if todo.save
            render json: {status: 200, todo: todo}
        else
            render json: {status:500}
        end
    end

    def update
        @todo.title = todo_params[:title]
        @todo.description = todo_params[:description]
        @todo.status = todo_params[:status]
        if @todo.save
            render json: {status:200, todo: @todo}
        else
            render json: {status:500}
        end
    end

    def destroy
        @todo.destroy
        render json: {status: 'SUCCESS'}
    end


    private

    def set_todo
        @todo = Todo.find(params[:id])
    end

    def todo_params
        params.permit(:title, :description, :status)
    end
end
