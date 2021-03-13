require 'rails_helper'

RSpec.describe Skill, type: :model do
  it 'should be a Skill class' do
    expect(subject).to be_a(Skill)
  end
end
