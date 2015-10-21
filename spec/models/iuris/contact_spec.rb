require 'spec_helper'

module Iuris::Contacts
	describe Contact do
		it 'has a valid factory' do
			expect(FactoryGirl.build(:contact)).to be_valid
		end

		it 'user_id is not nil' do
			contact = FactoryGirl.create(:contact)
			expect(contact.user_id).to_not be_nil
			expect(contact.user_id).to eq(1)
		end

		it 'should be raise error without user_id' do
			expect {FactoryGirl.create(:contact, user_id: nil)}.to raise_error(ActiveRecord::RecordInvalid)
		end

		it 'save contact is valid' do
			FactoryGirl.create(:contact)
			expect(Contact.count).to eq(1)
		end
	end
end