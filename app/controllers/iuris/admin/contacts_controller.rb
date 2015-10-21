module Iuris::Admin
	class ContactsController < AdminController

		def index
			@contacts = Iuris::Contacts::Contact.all
		end

	end
end