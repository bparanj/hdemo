class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :profiles do |t|
      t.hstore 'settings'
      
      t.timestamps
    end
    add_index :profiles, :settings, using: :gin
  end
end
