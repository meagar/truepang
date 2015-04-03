# Player joins a user to a match.
class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  has_many :scores

  validates :user, :match, presence: true
end
