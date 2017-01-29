class TasksController < ApplicationController

    def new
        # render the task
        @task = Task.new
    end

    def create
        # the tasks_params is the task info that the user creates
        @task = Task.new(tasks_params)
        @task.save

        # redirected to task_path because we want it to show
        # check out rake routes
        redirect_to task_path(@task)
    end

    # anything below not accessible to users
    private

    def tasks_params
        params.require(:task).permit(:content)
    end

end