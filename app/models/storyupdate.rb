class Storyupdate < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 140 }
  validates :text, presence: true,
                    length: { minimum: 5, maximum: 140 }
end

