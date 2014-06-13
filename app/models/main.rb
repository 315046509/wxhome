class Main < ActiveRecord::Base

  validates :name, :presence => {:message => "姓名不能为空！"}
  validates :tel, :presence => {:message => "电话不能为空！"}
  validates :address, :presence => {:message => "地址不能为空！"}
end
