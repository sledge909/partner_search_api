class PartnerSkill < ApplicationRecord
  belongs_to :partner
  belongs_to :skill

  validates :partner_id, :skill_id, presence: true
end
