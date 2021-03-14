class Service < ApplicationRecord
  has_many :partner_services
  has_many :partners, through: :partner_services
  has_many :skills, dependent: :destroy

  validates :name, presence: true
end
