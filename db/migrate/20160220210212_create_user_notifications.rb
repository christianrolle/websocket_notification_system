class CreateUserNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_notifications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :notification, index: true

      t.timestamps
    end
  end
end
