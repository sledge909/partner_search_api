class Skill < ApplicationRecord
  belongs_to :service
  has_many :partner_skills
  has_many :partners, through: :partner_skills
end
