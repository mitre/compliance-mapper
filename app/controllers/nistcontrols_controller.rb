class NistcontrolsController < ApplicationController
  before_action :set_nistcontrol, only: [:show, :edit, :update, :destroy]

  # GET /nistcontrols
  # GET /nistcontrols.json
  def index
    @nistcontrols = Nistcontrol.all
  end

  # GET /nistcontrols/1
  # GET /nistcontrols/1.json
  def show
  end

  # GET /nistcontrols/new
  def new
    @nistcontrol = Nistcontrol.new
  end

  # GET /nistcontrols/1/edit
  def edit
  end

  def convertNumberToID
    nistnumber = params[:id]
    nistnumber_shortened = nistnumber.include?("(")? nistnumber[0..nistnumber.index('(')-1] : nistnumber
    @nist = Nistcontrol.where(number: nistnumber_shortened)
    respond_to do |format|
      format.html
      format.json {render json: @nist}
    end
  end

  def convertToIA
    @nistNumber = params[:id]
    @mappedIAs = Iacontrol.where("nistcontrolnumber like ?", "%#{@nistNumber}%").all
    respond_to do |format|
      format.html
      format.json {render json: @mappedIAs}
    end
  end

  # POST /nistcontrols
  # POST /nistcontrols.json
  def create
    @nistcontrol = Nistcontrol.new(nistcontrol_params)

    respond_to do |format|
      if @nistcontrol.save
        format.html { redirect_to @nistcontrol, notice: 'Nistcontrol was successfully created.' }
        format.json { render :show, status: :created, location: @nistcontrol }
      else
        format.html { render :new }
        format.json { render json: @nistcontrol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nistcontrols/1
  # PATCH/PUT /nistcontrols/1.json
  def update
    respond_to do |format|
      if @nistcontrol.update(nistcontrol_params)
        format.html { redirect_to @nistcontrol, notice: 'Nistcontrol was successfully updated.' }
        format.json { render :show, status: :ok, location: @nistcontrol }
      else
        format.html { render :edit }
        format.json { render json: @nistcontrol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nistcontrols/1
  # DELETE /nistcontrols/1.json
  def destroy
    @nistcontrol.destroy
    respond_to do |format|
      format.html { redirect_to nistcontrols_url, notice: 'Nistcontrol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nistcontrol
      @nistcontrol = Nistcontrol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nistcontrol_params
      params.require(:nistcontrol).permit(:family, :number, :title, :priority, :basestatement, :withdrawn)
    end
end
