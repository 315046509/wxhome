class Question < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写标题"}
  validates :description, :presence => {:message => "请填写内容"}
  scope :order_ct_desc, lambda { order("created_at DESC") }
end
