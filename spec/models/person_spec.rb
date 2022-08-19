require 'rails_helper'

RSpec.describe Person, type: :model do
  it { is_expected.to have_many(:employments) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone_number) }

  context 'validation tests' do
		it 'ensures first name presence' do
			person = Person.new(last_name: 'Last', email: 'sample@example.com', phone_number: '3333333333', nickname: 'fast').save
			expect(person).to eq(false)
		end
		
		it 'ensures last name presence' do
			person = Person.new(first_name: 'First', email: 'sample@example.com', phone_number: '3333333333', nickname: 'fast').save
			expect(person).to eq(false)
		end
		
		it 'ensures email presence' do
			person = Person.new(first_name: 'First', last_name: 'Last', phone_number: '3333333333', nickname: 'fast').save
			expect(person).to eq(false)
		end

		it 'ensures phone number presence' do
			person = Person.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com', nickname: 'fast').save
			expect(person).to eq(false)
		end
		
		it 'should save successfully' do 
			person = Person.new(first_name: 'First', last_name: 'Last', email: 'sample@example.com', phone_number: '3333333333', nickname: 'fast').save
			expect(person).to eq(true)
		end
	end
end
