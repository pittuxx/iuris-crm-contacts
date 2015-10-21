module Iuris
  module Contacts
    module ApplicationHelper

    	def icon_user
    		return '<span class="glyphicon glyphicon-user" aria-hidden="true"></span>'.html_safe
    	end

    	def icon_edit
    		return '<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>'.html_safe
    	end

    	def icon_trash
    		return '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>'.html_safe
    	end

    end
  end
end