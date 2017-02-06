class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only:[:edit, :update, :show, :destroy]

  def index
    # all the tasks
    @tasks = current_user.tasks
  end

  def new
      # render the task
      @task = Task.new
  end

  def edit
  end

    def create
        # the tasks_params is the task info that the user creates
        @task = current_user.tasks.new(tasks_params)
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
      if @task.update(tasks_params)
        flash[:notice] = "Task was successfully updated!"
        redirect_to task_path(@task)
      else
        render 'edit'
      end
    end

    def show
    end

    def destroy
      @task.destroy
      flash[:notice] = "Task was successfully deleted!"
      redirect_to tasks_path
    end

    # anything below not accessible to users
    private

    def set_task
      # find the task by the task id in the params
      @task = Task.find(params[:id])
    end

    def tasks_params
        params.require(:task).permit(:content)
    end

end
