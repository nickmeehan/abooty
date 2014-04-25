class CreateReboots < ActiveRecord::Migration
  def change
    create_table :reboots do |t|
      t.belongs_to :aboot
      t.belongs_to :user
      t.timestamps
    end
  end
end
