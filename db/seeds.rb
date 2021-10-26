# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

(0...5).each do |_i|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(name: first_name, domain: 'example')
  phone_number = Faker::PhoneNumber.unique.cell_phone
  Account.create(
    email: email, last_name: last_name,
    first_name: first_name, status: :verified, phone_number: phone_number
  )
end
