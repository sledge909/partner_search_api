class Partner < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  attr_accessor :distance_from_customer

  has_many :partner_services, dependent: :destroy
  has_many :services, through: :partner_services
  has_many :partner_skills, dependent: :destroy
  has_many :skills, through: :partner_skills

  validates :name, :operating_radius, :rating, :address, presence: true

  def self.by_service_and_skill(criteria)
    joins(:services).where(services: { name: criteria.service })
      .joins(:skills).where(skills: { name: [criteria.material] })
      .order('rating desc')
  end

  def self.within_radius(criteria)
    by_service_and_skill(criteria).select do |partner|
      partner.within_operating_radius?(criteria.latitude, criteria.longitude)
    end
  end

  def within_operating_radius?(latitude, longitude)
    distance(latitude, longitude) <= operating_radius
  end

  private
  
  def distance(latitude, longitude)
    @distance_from_customer ||= distance_from([latitude, longitude])
  end
end
