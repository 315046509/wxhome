class WeixinController < ApplicationController
  layout 'weixin'

  def index
    @questions = Question.order_ct_desc.page(params[:page]).per(4)
    @roll = Case.all.order_ct_desc.page(params[:page]).per(4)
  end

  def contrast
    @questions = Question.order_ct_desc.page(params[:page]).per(4)
    @roll = Case.all.order_ct_desc.page(params[:page]).per(4)
  end
end
