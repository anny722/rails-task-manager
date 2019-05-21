# frozen_string_literal: true

# comment of class
class TasksController < ApplicationController
  before_action :let_task, only: %i[show edit update delete]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_permited)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    params[:completed] = true if params[:completed].to_i == 1
    @task.update(params_permited)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def params_permited
    params.require(:task).permit(:title, :details, :completed)
  end

  def let_task
    @task = Task.find(params[:id])
  end
end
