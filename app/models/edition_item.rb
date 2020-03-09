class EditionItem < ApplicationRecord
  belongs_to :edition
  belongs_to :item
end
