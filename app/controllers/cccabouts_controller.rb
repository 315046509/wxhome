class CccaboutsController < ApplicationController
  layout 'ccc'

  def index
  end

  def disclaimer
  end

  def privacy

  end

  def job
    @jobs = Job.order_ct_desc.page(params[:page]).per(3)
  end

  def contact
  end

  def links
    @zhaoshang = Zhaoshang.order_ct_desc.page(params[:page]).limit(1)
  end
end
