class NewsController < ApplicationController
  def index
    @roll = Case.all.order_ct_desc.page(params[:page]).per(10)
    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
  end

  def show
    @journalism = Journalism.find params[:id]
    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
  end
end
