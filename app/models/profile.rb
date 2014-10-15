class Profile < ActiveRecord::Base
   belongs_to :user
  validates :name, presence: true,
                    length: { minimum: 5, maximum: 140 }

  validates :country, presence: true,
                    length: { minimum: 5, maximum: 140 }

  validates :bio, presence: true,
                    length: { minimum: 5, maximum: 140 }
end
