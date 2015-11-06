Deface::Override.new(:virtual_path => "iuris/dashboard/index",
										:name => "add_contacts_prev_to_dashboard",
										:insert_after => "[data-iuris-hook='dashboard']",
										:partial => "overrides/dashboard_contacts_prev",
										:namespaced => true,
										:original => '0ac0826c8309a563daa0223079e6895d1ab93ae3')