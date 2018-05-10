require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Basic' do
    subject { build(:user) }

    it { expect(subject.valid?).to be true }

    it { should respond_to(:notifications) }
  end
end
