class PartnerSerializer
  attr_reader :partner
  private :partner

  def initialize(partner)
    @partner = partner
  end

  def self.for(partners)
    partners.map { |partner| new(partner) }
  end

  def as_json(_options = nil)
    {
      partner: 'partner data',
    }
  end

end
