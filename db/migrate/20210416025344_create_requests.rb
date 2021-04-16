class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :subject
      t.string :description

      t.timestamps
    end
  end
end
