class CreateAcaRailsUserVersions < ActiveRecord::Migration[5.0]

  TEXT_BYTES = 1_073_741_823

  def change
    create_table :aca_rails_user_versions do |t|
      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES

      t.datetime :created_at
    end
    add_index :aca_rails_user_versions, %i(item_type item_id)
  end

end
