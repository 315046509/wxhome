class Case < ActiveRecord::Base
  validates :title, :presence => {:message => "案例标题不能为空！"}, :length => {:maximum => 15, :message => "题目长度不能超过15"}
  validates :content, :presence => {:message => "案例内容不能为空！"}, :length => {:maximum => 200, :message => "案例内容长度不能超过200"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:zhengchang => "350x210", :thumb => "70x42#", :anli => "180x108#"}, :default_url => "/images/:style/missing.png",
                    :url => "/case/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']

  scope :order_ct_desc, lambda { order("created_at DESC") }

  @filepath="public/cases/"
  @previewpath = "previews/"

  # 删除图片
  def self.deletefile(r_id)
    idstr = format("%09d", r_id.to_s)
    one_path = @filepath+idstr[0, 3]+"/"
    two_path = one_path + idstr[3, 3]+"/"
    three_path = two_path + idstr[6, 3]+"/"
    begin
      `rm -rf #{Rails.root+three_path}`
    rescue
      if system "rm -rf #{Rails.root+three_path}"
        return true
      else
        return false
      end
    end
    return true
  end
end
