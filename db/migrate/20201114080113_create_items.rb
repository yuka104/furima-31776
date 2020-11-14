class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name,              null: false, default: ""
      t.text        :description,       null: false
      t.integer     :category_id,       null: false
      t.integer     :condition_id,      null: false
      t.references  :user,              foreign_key: true, default: ""
      t.integer     :price,             null: false 
      t.integer     :state_id,          null: false
      t.integer     :delivery_days_id,  null: false 
      t.integer     :fee_id,            null: false
      t.timestamps
    end
  end
end
