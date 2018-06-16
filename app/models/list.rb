class List < ApplicationRecord
  has_many :cards
  belongs_to :board

  validates_presence_of :name

# Normalmente colocaria-se um dependent: :destroy no has_many, porem dessa forma
# ao perder a referencia aos cards eles seriam automaticamente deletados, entao
# necessita-se fazer desta forma
  before_destroy :delete_cards

  def delete_cards
    self.cards.each do |card|
      card.destroy
    end
  end
  
  def board_diferente(id)
    transfer_list = List.find(id)
    self.board != transfer_list.board ? true : false
  end
end
