class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end 
    
    def show
        @task = Task.find(params[:id])
    end 
    
    def new
        @task = Task.new
    end 
    
    def create
        @task = Task.new(task_params)
        if @task.save
            flash[:success] = 'Task が正常に投稿されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Task が投稿されませんでした'
            render :now
        end 
    end 
    
    def edit
        @task = Task.find(params[:id])
    end
    
    private
    
    def task_params
        params.require(:task).permit(:content)
    end 
    
end
