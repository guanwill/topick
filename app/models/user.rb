class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}

  has_many :photos, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  acts_as_voter
end
