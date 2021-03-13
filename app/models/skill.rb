class Skill < ApplicationRecord
  belongs_to :service
  has_many :partners, through: :partner_skills
end
