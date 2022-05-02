class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: %i[ show edit update destroy ]

  # GET /goals or /goals.json
  def index
    # @goals = Goal.all
    @goals = current_user.goals.all
  end

  # GET /goals/1 or /goals/1.json
  # def show
  # end

  # GET /goals/new
  def new
    @goal = current_user.goals.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals or /goals.json
  def create
    @goal = current_user.goals.new(goal_params)


      if @goal.save
         @status = true
      else
         @status = false
      end

  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update

      if @goal.update(goal_params)
         @status = true
      else
         @status = false
      end

  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = current_user.goals.find(params[:id])
      redirect_to(goals_url, alert: "ERROR!!") if @goal.blank?
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:title, :user_id)
    end
end
