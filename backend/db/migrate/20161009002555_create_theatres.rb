class CreateTheatres < ActiveRecord::Migration[5.0]
  def change
    create_table :theatres do |t|

      t.timestamps
    end
  end
end
