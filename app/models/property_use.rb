class PropertyUse < ApplicationRecord

belongs_to :property
belongs_to :activity

validates :activity, :uniqueness => {:scope => :property}

end
