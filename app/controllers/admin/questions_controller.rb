class Admin::QuestionsController < Admin::MainController
  layout 'admin'

  def index
    @questions = Question.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(
        :title => params[:question][:title],
        :description => params[:question][:description]
    )
    if @question.save
      flash[:note] = "创建成功"
      redirect_to admin_questions_path and return
    else
      flash[:error_msg] = @question.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    update_category = @question.update_attributes(
        :title => params[:question][:title],
        :description => params[:question][:description]
    )
    if update_category
      respond_to do |category|
        category.html {
          redirect_to admin_questions_path and return
        }
      end
    end
  end

  def show
    @question = Question.find params[:id]
  end

  #   删除
  def destroy
    @question = Question.find(params[:id])
    flash[:error_msg] = @question.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_questions_path and return
  end
end
