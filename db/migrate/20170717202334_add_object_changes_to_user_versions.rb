class AddObjectChangesToUserVersions < ActiveRecord::Migration[5.0]
  def change
    add_column :aca_rails_user_versions, :object_changes, :text
  end
end
