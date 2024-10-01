class CreateWords < ActiveRecord::Migration[7.2]
  def change
    create_table :words do |t|
      t.string :term
      t.text :definition

      t.timestamps
    end
  end
end
