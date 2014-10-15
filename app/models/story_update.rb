class StoryUpdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  validates :write, presence: true,
                    length: { minimum: 20, maximum: 140 }
end
