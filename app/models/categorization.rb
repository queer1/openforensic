class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :created_at, :exhibit_id
  
  belongs_to :exhibit
  belongs_to :category
end
