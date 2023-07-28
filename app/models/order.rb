class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  belongs_to :rider
end
