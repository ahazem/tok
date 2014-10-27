class Create<%= model.pluralize %> < ActiveRecord::Migration
  def change
    create_table :<%= model.tableize %> do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :authentication_token
      
      t.timestamps
    end

    add_index :<%= model.tableize %>, :email, unique: true
  end
end
