class CreateIurisContacts < ActiveRecord::Migration
  def change
    create_table :iuris_contacts_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone
      t.text :comments
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :iuris_contacts_contacts, :iuris_users
  end
end
