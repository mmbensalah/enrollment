require 'rails_helper'

describe Student, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end
  describe 'Relationship' do
    it {should have_many :addresses}
    it {should have_many :courses}
  end
end
