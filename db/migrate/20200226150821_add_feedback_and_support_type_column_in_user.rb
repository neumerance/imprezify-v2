class AddFeedbackAndSupportTypeColumnInUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :support_type, :integer, default: 0
    add_column :users, :sent_feedback, :boolean, default: false
  end

  def down
    remove_column :users, :support_type
    remove_column :users, :sent_feedback
  end
end
