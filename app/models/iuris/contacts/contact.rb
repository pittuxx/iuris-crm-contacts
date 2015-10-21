module Iuris::Contacts
  class Contact < ActiveRecord::Base
    belongs_to :user
    validates :user, presence: true, associated: true

    scope :ordered, -> {order('created_at desc')}

  end
end
