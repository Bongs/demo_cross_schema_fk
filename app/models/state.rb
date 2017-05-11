class State < ApplicationRecord
  has_many :companies
  has_many :parties
end