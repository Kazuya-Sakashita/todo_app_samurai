class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :sort]


  # GET /todos/new
  def new
 #@goalに紐付いたtodosをnewしています
    @todo = @goal.todos.new
  end

  # GET /todos/1/edit
  def edit
  end

  def sort
  end

  # POST /todos or /todos.json
  def create
    @todo = @goal.todos.new(todo_params)

      if @todo.save
         @status = true
      else
         @status = false
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
         @status = true
      else
         @status = false
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy
    end
  end

  private

    def set_goal
    @goal = current_user.goals.find_by(id: params[:goal_id])
    redirect_to(goals_url, alert: "ERROR!!") if @goal.blank?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = @goal.todos.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:content, :goal_id, :position, :done)
    end
end
