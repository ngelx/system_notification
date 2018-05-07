class CreateSystemNotificationMessages < ActiveRecord::Migration
  def change
    create_table :system_notification_messages do |t|
      t.integer :user_id, null: false
      t.boolean :seen, null: false, default: false
      t.boolean :dismiss, null: false, default: false
      t.integer :level, null: false, default: 0
      t.text :text

      t.timestamps null: false
    end

    add_index 'system_notification_messages', %w[user_id seen], name: 'idx_message_seen'
    add_index 'system_notification_messages', %w[user_id dismiss], name: 'idx_message_dismiss'
  end
end
