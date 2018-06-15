class List < ApplicationRecord
  has_many :cards
  belongs_to :board

  validates_presence_of :name

  before_destroy :delete_cards

  def delete_cards
    self.cards.each do |card|
      card.destroy
    end
  end
end
