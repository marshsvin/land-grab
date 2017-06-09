class Activity < ApplicationRecord

has_many :property_uses, :dependent => :destroy
has_many :properties, :through => :property_uses, :source => :property



end
