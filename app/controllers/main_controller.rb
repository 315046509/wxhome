class MainController < ApplicationController
  def index
    @questions = Question.order_ct_desc.page(params[:page]).per(3)
    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
    @roll = Case.all.order_ct_desc.page(params[:page]).per(16)
  end
end
