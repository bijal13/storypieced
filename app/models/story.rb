class Story < ActiveRecord::Base
  has_many :story_updates
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 140 }
  validates :write, presence: true,
                    length: { minimum: 20, maximum: 140 }
end
