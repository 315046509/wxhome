class MainsController < ApplicationController
  before_action :set_main, only: [:show, :edit, :update, :destroy]
  layout 'admin_no_sider'

  # GET /mains
  # GET /mains.json
  def index
    @mains = Main.all
  end

  # GET /mains/1
  # GET /mains/1.json
  def show
  end

  # GET /mains/new
  def new
    @main = Main.new
  end


  # POST /mains
  # POST /mains.json
  def create
    @main = Main.new(main_params)

    respond_to do |format|
      if @main.save
        format.html { redirect_to @main, notice: '您已注册成功，请点击返回首页' }
        format.json { render :show, status: :created, location: @main }
      else
        format.html { render :new }
        format.json { render json: @main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mains/1
  # DELETE /mains/1.json
  def destroy
    @main.destroy
    respond_to do |format|
      format.html { redirect_to mains_url, notice: 'Main was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_main
    @main = Main.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def main_params
    params.require(:main).permit(:name, :tel, :address)
  end
end
