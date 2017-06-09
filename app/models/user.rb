class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true, :uniqueness => true

  has_many :property_reviews
  has_many :properties, :dependent => :destroy
  has_many :requests, :dependent => :destroy
end
