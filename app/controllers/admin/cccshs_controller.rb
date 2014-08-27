class Admin::CccshsController < Admin::MainController
  layout 'admin'

  def index
    @questions = Zhaoshang.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @question = Zhaoshang.new
  end

  def create
    @question = Zhaoshang.new(
        :title => params[:zhaoshang][:title],
        :description => params[:zhaoshang][:description]
    )
    if @question.save
      flash[:note] = "创建成功"
      redirect_to admin_cccshs_path and return
    else
      flash[:error_msg] = @question.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def show
    @question = Zhaoshang.find params[:id]
  end

  #   删除
  def destroy
    @question = Zhaoshang.find(params[:id])
    flash[:error_msg] = @question.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_cccshs_path and return
  end
end
