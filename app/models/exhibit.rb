class Exhibit < ActiveRecord::Base  
  attr_accessible :content, :investigation_id, :name, :user_id, :media, :media_html
  belongs_to :investigation
  
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  validates :name, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  
  default_scope -> { order('created_at DESC') }
  
  auto_html_for :media do
      html_escape
      image
      youtube(:width => 400, :height => 250)
      link :target => "_blank", :rel => "nofollow"
      simple_format
  end
  
end
