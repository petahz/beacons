class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :video_url
      t.string :supertype
    end
  end
end
