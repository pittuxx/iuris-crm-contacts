Iuris::Admin::AdminController.class_eval do
	before_action :set_contacts, only: :index

	private

	def set_contacts
		@contacts = Iuris::Contacts::Contact.ordered
	end	
end