class Skill < ApplicationRecord
  belongs_to :service
  belongs_to :partner
end
