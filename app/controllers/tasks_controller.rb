class TasksController < ApplicationController

  def index
    # all the tasks
    @tasks = Task.all
  end

  def new
      # render the task
      @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

    def create
        # the tasks_params is the task info that the user creates
        @task = Task.new(tasks_params)
        if @task.save
          flash[:notice] = "Task was successfully created!"
          # redirected to task_path because we want it to show
          # check out rake routes
          redirect_to task_path(@task)
        else
          render 'new'
        end

    end

    def update
      @task = Task.find(params[:id])
      if @task.update(tasks_params)
        flash[:notice] = "Task was successfully updated!"
        redirect_to task_path(@task)
      else
        render 'edit'
      end
    end

    def show
      # find the task by the task id in the params
      @task = Task.find(params[:id])
    end

    # anything below not accessible to users
    private

    def tasks_params
        params.require(:task).permit(:content)
    end

end
