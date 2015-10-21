Iuris::User.class_eval do
	has_many :contacts, class_name: Iuris::Contacts::Contact
end