class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :topic
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
