class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url
      t.integer :visits_count

      t.timestamps null: false
    end
  end
end
