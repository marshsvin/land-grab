class Property < ApplicationRecord

  belongs_to :user
  has_many :pictures
  has_many :property_reviews, :dependent => :destroy
  has_many :requests, :dependent => :destroy
  has_many :property_uses, :dependent => :destroy
  has_many :activities, :through => :property_uses, :source => :activity

  validates :address, :uniqueness => true
  
end
