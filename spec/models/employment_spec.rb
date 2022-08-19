require 'rails_helper'

RSpec.describe Employment, type: :model do
  it { is_expected.to belong_to(:person) }
  it { is_expected.to validate_presence_of(:employer) }
  it { is_expected.to validate_presence_of(:date_started) }
  it { is_expected.to validate_presence_of(:date_ended) }

  context 'validation tests' do
    current_person = Person.first_or_create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, phone_number: Faker::PhoneNumber.phone_number)

		it 'ensures employer presence' do
			employment = Employment.new(date_started: Date.today, date_ended: Date.today).save
			expect(employment).to eq(false)
		end
		
		it 'ensures date started presence' do
			employment = Employment.new(employer: 'Company', date_ended: Date.today).save
			expect(employment).to eq(false)
		end
		
		it 'ensures date ended presence' do
			employment = Employment.new(employer: 'Company', date_started: Date.today).save
			expect(employment).to eq(false)
		end
		
		it 'should save successfully' do 
			employment = Employment.new(person: current_person, employer: 'Company', date_started: Date.today, date_ended: Date.today).save
			expect(employment).to eq(true)
		end
	end

end
