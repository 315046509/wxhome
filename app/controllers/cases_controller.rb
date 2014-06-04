class CasesController < ApplicationController
  def index
    @roll = Case.all.order_ct_desc.page(params[:page]).per(30)
  end

  def show
    @roll = Case.find params[:id]
  end
end
