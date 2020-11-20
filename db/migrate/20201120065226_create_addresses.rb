class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,    null: false, default: ""
      t.integer     :state_id,       null: false
      t.string      :city,           null: false, default: ""
      t.string      :block_number,   null: false, default: ""
      t.string      :building           
      t.string      :phone_number,   null: false, default: ""
      t.references  :purchase,       foreign_key: true, default: ""
      t.timestamps
    end
  end
end
