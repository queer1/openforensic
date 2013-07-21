class Investigation < ActiveRecord::Base
  attr_accessible :title, :content, :investigationimage, :user_id
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :investigationimage, presence: true
  mount_uploader :investigationimage, ImageUploader
  
  default_scope -> { order('created_at DESC') }
end
