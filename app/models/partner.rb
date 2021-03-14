class Partner < ApplicationRecord
  has_many :partner_services, dependent: :destroy
  has_many :services, through: :partner_services
  has_many :partner_skills, dependent: :destroy
  has_many :skills, through: :partner_skills

  def self.by_service_and_skill(criteria)
    joins(:services).where(services: { name: criteria.service })
      .joins(:skills).where(skills: { name: [criteria.material] })
  end

end
