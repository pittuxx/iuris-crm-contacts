Deface::Override.new(:virtual_path => "admin/shared/_nav",
										:name => "add_contacts_link_to_admin",
										:insert_after => "[data-iuris-hook='admin-links']",
										:partial => "overrides/admin_contacts_link",
										:namespaced => true,
										:original => 'a563ff6604b4c69deb8fed32d4aadcadaf23e837')