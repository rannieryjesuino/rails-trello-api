class List < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :board
  
  validates_presence_of :name
end
