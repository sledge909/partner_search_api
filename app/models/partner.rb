class Partner < ApplicationRecord
  has_many :services, through: :company_services
  has_many :skills, through: :partner_skills


end
