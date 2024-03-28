class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update destroy]

  def index
    tasks = Task.all.as_json(include:{
      assigned_user:{
        only:%i[name id]
      }
    })

   render_json({tasks:})
  end

  def create
    task = Task.new(task_params)
    task.save!
    render_notice("Task was successfully created")
  end

  def show
    render
  end

  def update
    @task.update!(task_params)
    render_notice("Task was successfully updated!")
  end

  def destroy
    @task.destroy!
    render_json
  end
  private
   def task_params
    params.require(:task).permit(:title,:assigned_user_id)
   end

   def load_task!
    @task = Task.find_by!(slug: params[:slug])
  end
end
