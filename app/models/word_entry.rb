class WordEntry < ApplicationRecord
  belongs_to :alphabet
  has_many :translations
end
