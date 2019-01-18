class RecruitersController < ApplicationController
  before_action :set_recruiter, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_authentication
  skip_authorize_resource 

  # GET /recruiters
  # GET /recruiters.json
  def index
    @recruiters = Recruiter.all
    render_json_serializer(@recruiters)
  end

  # GET /recruiters/1
  # GET /recruiters/1.json
  def show
    render_json_message({:success => t('.success')}, 201, {recruiter: @recruiter})
  end

  # POST /recruiters
  # POST /recruiters.json
  def create
    @recruiter = Recruiter.new(recruiter_params)

    if @recruiter.save
      render_json_message({:success => t('.success')}, 201, {id: @recruiter.id})
    else
      render_json_message({:errors => @recruiter.errors.messages}, 422)
    end

  end

  # PATCH/PUT /recruiters/1
  # PATCH/PUT /recruiters/1.json
  def update
    if @recruiter.update(recruiter_params)
      render_json_message({success: t('.success')}, 200)
    else
      render_json_message({errors: @recruiter.errors.messages}, 422)
    end
  end

  # DELETE /recruiters/1
  # DELETE /recruiters/1.json
  def destroy
    if @recruiter.destroy
      render_json_message({:success => t('.success')}, 200)
    else
      render_json_message({:errors => @recruiter.errors.messages}, 422)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter
      @recruiter = Recruiter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruiter_params
      params.require(:recruiter).permit(:description, :cnpj, :telephone)
    end
end
