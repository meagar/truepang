class Game < ActiveRecord::Base
  has_many :players
  belongs_to :match

  validates :match, presence: true
end
