class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(task_params)
    task.save!
    redirect_to task_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク　「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク　「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.repuire(:task).permit(:name, :description)
  end

end
