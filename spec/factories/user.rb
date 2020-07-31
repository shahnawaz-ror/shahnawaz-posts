FactoryBot.define do
  factory :user do
    email { 'sample@gmail.com' }
    password { 'password' }
    password_confirmation { 'password' }
    first_name { 'shahnawz' }
    last_name { 'dhande' }
    birth_date { '15-10-1999' }
  end
end
