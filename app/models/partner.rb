class Partner < ApplicationRecord
  has_many :partner_services
  has_many :services, through: :partner_services
  has_many :partner_skills
  has_many :skills, through: :partner_skills


end
