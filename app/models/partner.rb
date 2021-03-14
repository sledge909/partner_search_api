class Partner < ApplicationRecord
  DEFAULT_WITHIN = 50

  geocoded_by :address
  after_validation :geocode

  has_many :partner_services, dependent: :destroy
  has_many :services, through: :partner_services
  has_many :partner_skills, dependent: :destroy
  has_many :skills, through: :partner_skills

  def self.by_service_and_skill(criteria)
    joins(:services).where(services: { name: criteria.service })
      .joins(:skills).where(skills: { name: [criteria.material] })
  end

  def within_operating_radius?(latitude, longitude)
    distance_from([latitude, longitude]) <= operating_radius
  end
end
