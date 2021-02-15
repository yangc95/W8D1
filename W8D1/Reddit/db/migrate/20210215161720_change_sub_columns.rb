class ChangeSubColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :content
    remove_column :subs, :url
    add_column :subs, :description, :text, null: false
    rename_column :subs, :author_id, :moderator_id
  end
end
