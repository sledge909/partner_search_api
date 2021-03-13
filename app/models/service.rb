class Service < ApplicationRecord
  has_many :skills
  belongs_to :partner
end
