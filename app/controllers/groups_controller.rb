class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_authentication
  skip_authorize_resource 

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    render_json_serializer(@groups)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    render_json_message({:success => t('.success')}, 201, {group: @group})
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      render_json_message({:success => t('.success')}, 201, {id: @group.id})
    else
      render_json_message({:errors => @group.errors.messages}, 422)
    end

  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render_json_message({success: t('.success')}, 200)
    else
      render_json_message({errors: @group.errors.messages}, 422)
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @group.destroy
      render_json_message({:success => t('.success')}, 200)
    else
      render_json_message({:errors => @group.errors.messages}, 422)
    end
  end

  private

    def set_recruiters_options
      @set_recruiters_options = Recruiter.all.pluck(:area, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:area, :recruiter_id)
    end
end