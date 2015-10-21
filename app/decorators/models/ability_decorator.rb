require 'cancan'

module Iuris
	module Contacts
		class AbilityDecorator
			include CanCan::Ability

			def initialize(user)
				unless user.admin?
					can :manage, Iuris::Contacts::Contact, user_id: user.id
				end
			end
		end
	end
end

Iuris::Ability.register_ability(Iuris::Contacts::AbilityDecorator)