class FlagClassesController < ApplicationController
  before_action :set_flag_class, only: [:show, :edit, :update, :destroy]

  def assign_class
    Flag.find(params[:flag_id]).update(:flag_class_id => params[:flag_class_id])
  end

  # GET /flag_classes
  # GET /flag_classes.json
  def index
    @flag_classes = FlagClass.all
  end

  # GET /flag_classes/1
  # GET /flag_classes/1.json
  def show
  end

  # GET /flag_classes/new
  def new
    @flag_class = FlagClass.new
  end

  # GET /flag_classes/1/edit
  def edit
  end

  # POST /flag_classes
  # POST /flag_classes.json
  def create
    @flag_class = FlagClass.new(flag_class_params)

    respond_to do |format|
      if @flag_class.save
        format.html { redirect_to @flag_class, notice: 'Flag class was successfully created.' }
        format.json { render :show, status: :created, location: @flag_class }
      else
        format.html { render :new }
        format.json { render json: @flag_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flag_classes/1
  # PATCH/PUT /flag_classes/1.json
  def update
    respond_to do |format|
      if @flag_class.update(flag_class_params)
        format.html { redirect_to @flag_class, notice: 'Flag class was successfully updated.' }
        format.json { render :show, status: :ok, location: @flag_class }
      else
        format.html { render :edit }
        format.json { render json: @flag_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flag_classes/1
  # DELETE /flag_classes/1.json
  def destroy
    @flag_class.destroy
    respond_to do |format|
      format.html { redirect_to flag_classes_url, notice: 'Flag class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag_class
      @flag_class = FlagClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flag_class_params
      params.require(:flag_class).permit(:name, :color)
    end
end
