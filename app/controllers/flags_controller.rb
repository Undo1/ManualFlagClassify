require 'csv'

class FlagsController < ApplicationController
  before_action :set_flag, only: [:show, :edit, :update, :destroy]

  def import
  end

  def import_csv
    csv_text = params[:file].read
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts row.to_hash
      Flag.create!(:result => row["Flag Result"] == "Helpful", :result_reason => row["Reason"], :flag_text => row["Flag Text"].force_encoding("utf-8"))
    end

    render :plain => "OK", :status => 200
  end

  # GET /flags
  # GET /flags.json
  def index
    @flags = Flag.where(:flag_class_id => nil).where("flag_text LIKE '%search%'")
    @flag_classes = FlagClass.all
  end

  # GET /flags/1
  # GET /flags/1.json
  def show
  end

  # GET /flags/new
  def new
    @flag = Flag.new
  end

  # GET /flags/1/edit
  def edit
  end

  # POST /flags
  # POST /flags.json
  def create
    @flag = Flag.new(flag_params)

    respond_to do |format|
      if @flag.save
        format.html { redirect_to @flag, notice: 'Flag was successfully created.' }
        format.json { render :show, status: :created, location: @flag }
      else
        format.html { render :new }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flags/1
  # PATCH/PUT /flags/1.json
  def update
    respond_to do |format|
      if @flag.update(flag_params)
        format.html { redirect_to @flag, notice: 'Flag was successfully updated.' }
        format.json { render :show, status: :ok, location: @flag }
      else
        format.html { render :edit }
        format.json { render json: @flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flags/1
  # DELETE /flags/1.json
  def destroy
    @flag.destroy
    respond_to do |format|
      format.html { redirect_to flags_url, notice: 'Flag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flag_params
      params.require(:flag).permit(:result, :result_reason, :flag_text)
    end
end
