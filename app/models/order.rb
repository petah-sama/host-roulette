class Order < ApplicationRecord
  has_many :orders

   monetize :amount_cents

end
