class QuestionsController < ApplicationController
  def index
    @questions = Question.order_ct_desc.page(params[:page]).per(8)
    @roll = Case.all.order_ct_desc.page(params[:page]).per(10)
  end

  def show
    @question = Question.find params[:id]
    @questions = Question.order_ct_desc.page(params[:page]).per(20)
  end
end
