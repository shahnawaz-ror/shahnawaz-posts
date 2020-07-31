require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(first_name: 'first name',
                        last_name: 'last name',
                        birth_date: DateTime.now - 19.years,
                        email: 'sample@gmail.com',
                        password: '123456',
                        password_confirmation: '123456')
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first_name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a last_name' do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a birth_date' do
    subject.birth_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with age less than 18' do
    subject.birth_date = DateTime.now - 17.years
    expect(subject).to_not be_valid
  end
end
