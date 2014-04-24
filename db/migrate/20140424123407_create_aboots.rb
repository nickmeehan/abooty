class CreateAboots < ActiveRecord::Migration
  def change
    create_table :aboots do |t|
      t.belongs_to :user
      t.string :content
      t.timestamps
    end
  end
end
