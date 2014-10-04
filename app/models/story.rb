class Story < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 140 }
  validates :write, presence: true,
                    length: { minimum: 20, maximum: 140 }
end
