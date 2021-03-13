require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'should be a Service class' do
    expect(subject).to be_a(Service)
  end
end
