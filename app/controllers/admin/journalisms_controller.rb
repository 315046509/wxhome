class Admin::JournalismsController < Admin::MainController
  layout 'admin'

  def index
    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @journalism = Journalism.new
  end

  def create
    @journalism = Journalism.new(
        :title => params[:journalism][:title],
        :description => params[:journalism][:description]
    )
    if @journalism.save
      flash[:note] = "创建成功"
      redirect_to admin_journalisms_path and return
    else
      flash[:error_msg] = @journalism.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def edit
    @journalism = Journalism.find(params[:id])
  end

  def update
    @category = Journalism.find(params[:id])
    update_category = @category.update_attributes(
        :title => params[:journalism][:title],
        :description => params[:journalism][:description]
    )
    if update_category
      respond_to do |category|
        category.html {
          redirect_to admin_journalisms_path and return
        }
      end
    end
  end

  def show
    @journalism = Journalism.find params[:id]
  end

  #   删除
  def destroy
    @journalism = Journalism.find(params[:id])
    flash[:error_msg] = @journalism.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_journalisms_path and return
  end
end
