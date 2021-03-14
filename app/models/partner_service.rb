class PartnerService < ApplicationRecord
  belongs_to :partner
  belongs_to :service

  validates :partner_id, :service_id, presence: true
end
