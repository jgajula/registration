class User < ActiveRecord::Base
  attr_accessible :birthdate, :email, :firstname, :lastname, :location, :password, :jobs_attributes
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true
  validates :password , :presence => true,
                        :length => { :minimum => 6}
                      
  has_many :jobs, :dependent => :destroy
  
  accepts_nested_attributes_for :jobs, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
