class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string     :customer_first_name
      t.string     :customer_last_name,  null: false
      t.string     :customer_occupation, null: false
      t.string     :position
      t.text       :note
      t.references :schedule,            foreign_key: true
      t.timestamps
    end
  end
end
