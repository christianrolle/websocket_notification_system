class CreateProjectLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_likes do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
