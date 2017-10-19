class CreateWebpages < ActiveRecord::Migration[5.1]
  def change
    create_table :webpages do |t|
      t.string :title
      t.string :description
      t.string :body
      t.string :author
      t.string :url

      t.timestamps
    end
  end
end
