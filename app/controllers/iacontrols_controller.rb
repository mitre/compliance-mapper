class IacontrolsController < ApplicationController
  before_action :set_iacontrol, only: [:show, :edit, :update, :destroy]

  # GET /iacontrols
  # GET /iacontrols.json
  def index
    @iacontrols = Iacontrol.all
  end

  # GET /iacontrols/1
  # GET /iacontrols/1.json
  def show
  end

  # GET /iacontrols/new
  def new
    @iacontrol = Iacontrol.new
  end

  # GET /iacontrols/1/edit
  def edit
  end

  # POST /iacontrols
  # POST /iacontrols.json
  def create
    @iacontrol = Iacontrol.new(iacontrol_params)

    respond_to do |format|
      if @iacontrol.save
        format.html { redirect_to @iacontrol, notice: 'Iacontrol was successfully created.' }
        format.json { render :show, status: :created, location: @iacontrol }
      else
        format.html { render :new }
        format.json { render json: @iacontrol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iacontrols/1
  # PATCH/PUT /iacontrols/1.json
  def update
    respond_to do |format|
      if @iacontrol.update(iacontrol_params)
        format.html { redirect_to @iacontrol, notice: 'Iacontrol was successfully updated.' }
        format.json { render :show, status: :ok, location: @iacontrol }
      else
        format.html { render :edit }
        format.json { render json: @iacontrol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iacontrols/1
  # DELETE /iacontrols/1.json
  def destroy
    @iacontrol.destroy
    respond_to do |format|
      format.html { redirect_to iacontrols_url, notice: 'Iacontrol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iacontrol
      @iacontrol = Iacontrol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iacontrol_params
      params.require(:iacontrol).permit(:nistcontrolnumber, :controlSubjectArea, :impact, :name, :description, :number)
    end
end
