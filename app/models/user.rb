class User < ActiveRecord::Base
  after_create :create_profile

  has_many :stories
  has_one :profile
  has_many :stories, through: :story_updates
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_profile
  self.profile.create
  end
  def admin?
    admin
  end
end

