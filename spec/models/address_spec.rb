require 'rails_helper'

describe Address, type: :model do
  describe 'Relationship' do
    it {should belong_to :student}
  end
end
