class Journalism < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写标题"}, :length => {:maximum => 15, :message => "标题必须小于15个字"}
  validates :description, :presence => {:message => "请填写内容"}
  scope :order_ct_desc, lambda { order("created_at DESC") }
end
