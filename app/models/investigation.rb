class Investigation < ActiveRecord::Base
  # belongs_to :user
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :players, dependent: :destroy
  has_many :exhibits, dependent: :destroy
  
  attr_accessible :title, :content, :investigationimage, :user_id, :crop_x, :crop_y, :crop_w, :crop_h
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :investigationimage, presence: true
  mount_uploader :investigationimage, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_investigationimage
  
  def crop_investigationimage
    investigationimage.recreate_versions! if crop_x.present?
  end
  
  default_scope -> { order('created_at DESC') }
end
