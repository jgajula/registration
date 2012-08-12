class Job < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :title
  validates :title, :presence => true
  validates :company, :presence => true
end
