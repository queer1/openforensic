class User < ActiveRecord::Base 
  has_many :investigations, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_investigations, through: :relationships, source: :followed
  
  attr_accessible :name, :email, :password, :password_confirmation, :image
  mount_uploader :image, ImageUploader
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def following?(some_investigation)
    relationships.find_by_followed_id(some_investigation.id)
  end
  
  def follow!(some_investigation)
    self.relationships.create!(followed_id: some_investigation.id)
  end
  
  def unfollow!(some_investigation)
    relationships.find_by_followed_id(some_investigation.id).destroy
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end