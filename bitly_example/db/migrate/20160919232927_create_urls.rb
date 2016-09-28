class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.belongs_to :user#se crea la llave foránea user_id
      t.string :short_url
      t.string :long_url
      t.integer :visits_count, :default => 0

      t.timestamps null: false
    end
  end
end
