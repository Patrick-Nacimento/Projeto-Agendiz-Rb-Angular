class InternsController < ApplicationController
  before_action :set_intern, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_authentication
  skip_authorize_resource 

    # GET /interns
  # GET /interns.json
  def index
    @interns = Intern.all
    render_json_serializer(@interns)
  end

  # GET /interns/1
  # GET /interns/1.json
  def show
    render_json_message({:success => t('.success')}, 201, {intern: @intern})
  end

  # POST /interns
  # POST /interns.json
  def create
    @intern = Intern.new(intern_params)

    if @intern.save
      render_json_message({:success => t('.success')}, 201, {id: @intern.id})
    else
      render_json_message({:errors => @intern.errors.messages}, 422)
    end

  end

  # PATCH/PUT /interns/1
  # PATCH/PUT /interns/1.json
  def update
    if @intern.update(intern_params)
      render_json_message({success: t('.success')}, 200)
    else
      render_json_message({errors: @intern.errors.messages}, 422)
    end
  end

  # DELETE /interns/1
  # DELETE /interns/1.json
  def destroy
    if @intern.destroy
      render_json_message({:success => t('.success')}, 200)
    else
      render_json_message({:errors => @intern.errors.messages}, 422)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intern
      @intern = Intern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intern_params
      params.require(:intern).permit(:description, :age, :telephone, :quality, :defect, :group_id)
    end
end