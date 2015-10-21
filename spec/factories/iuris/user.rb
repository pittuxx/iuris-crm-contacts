require 'faker'

module Iuris
	FactoryGirl.define do
		factory :user, class: 'Iuris/User' do |f|
			f.email {Faker::Internet.email}
			password 'password'
			password_confirmation 'password'
			admin false
		end

		factory :admin, parent: :user do |f|
			admin true
		end
	end
end