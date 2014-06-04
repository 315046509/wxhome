class MainController < ApplicationController
  def index
    @questions = Question.order_ct_desc.page(params[:page]).per(3)
  end
end
