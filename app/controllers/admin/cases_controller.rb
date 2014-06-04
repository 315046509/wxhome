class Admin::CasesController < Admin::MainController
  layout 'admin'
  before_action :roll_params, :only => [:create]
  before_filter :get_roll, :only => [:destroy]

  def index
    @roll = Case.all.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @roll = Case.new
  end

  def create
    if request.post?
      if params[:case]
        avatar = params[:case][:avatar]
        title = params[:case][:title]
        content = params[:case][:content]
        imagename = avatar.original_filename
        avatar.original_filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<imagename[imagename.length-4, 4]
        if !avatar.blank? && !title.blank? && !content.blank?
          rc = Case.create(:avatar => avatar, :title => title, :content => content)
          if rc.valid?
          else
            msg = ""
            rc.errors.full_messages.each { |error| msg+= error }
            flash[:error]= msg
            redirect_to :back and return
          end
          redirect_to admin_cases_path and return
        else
          flash[:error_msg]="添加失败，请检查添加项是否有空值！"
          redirect_to :back and return
        end
      end
    end
  end

  def show
    @roll = Case.find params[:id]
  end


  def edit
    @case = Case.find(params[:id])
  end

  def update
    @job = Case.find(params[:id])
    update_category = @job.update_attributes(
        :title => params[:case][:title],
        :content => params[:case][:content]
    )
    if update_category
      respond_to do |job|
        job.html {
          redirect_to admin_cases_path and return
        }
      end
    end
  end

  def destroy
    @roll = Case.find params[:id]
    Case.deletefile(@roll.id)
    @roll.destroy
    redirect_to admin_cases_path and return
  end

  private
  def get_roll
    @roll = Case.where(:id => params[:id]).first
  end

  def roll_params
    params.require(:case).permit(:avatar, :title, :content)
  end
end
