class CreateNewsletterMembers < ActiveRecord::Migration
  def change
    create_table :newsletter_members do |t|
      t.string :email

      t.timestamps
    end
  end
end
