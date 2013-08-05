class Player < ActiveRecord::Base
  attr_accessible :content, :investigation_id, :name, :playerimage, :user_id
  belongs_to :investigation

  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :playerimage, presence: true
  mount_uploader :playerimage, ImageUploader
  
  default_scope -> { order('created_at DESC') }
end
