class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :follower, index: true

      t.timestamps
    end
  end
end
