require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { build(:employee) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_numericality_of(:salary).is_greater_than_or_equal_to(0) }
  end
end
