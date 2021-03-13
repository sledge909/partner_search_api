class Service < ApplicationRecord
  has_many :skills
  has_many :partners, through: :partner_services
end
