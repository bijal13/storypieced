class Story < ActiveRecord::Base
  has_many :storyupdates
  has_many :users, through: :storyupdates
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 140 }
  validates :write, presence: true,
                    length: { minimum: 5, maximum: 140 }


end
