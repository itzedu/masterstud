class Card < ActiveRecord::Base
  validates :front, :back, presence: true
  belongs_to :deck
end
