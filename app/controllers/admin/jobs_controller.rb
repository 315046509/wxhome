class Admin::JobsController < Admin::MainController
  layout 'admin'

  def index
    @questions = Job.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @question = Job.new
  end

  def create
    @question = Job.new(
        :title => params[:job][:title],
        :description => params[:job][:description]
    )
    if @question.save
      flash[:note] = "创建成功"
      redirect_to admin_jobs_path and return
    else
      flash[:error_msg] = @question.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def show
    @job = Job.find params[:id]
  end

  #   删除
  def destroy
    @question = Job.find(params[:id])
    flash[:error_msg] = @question.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_jobs_path and return
  end
end
