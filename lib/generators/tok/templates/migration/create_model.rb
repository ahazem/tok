class Create<%= model_class.pluralize %> < ActiveRecord::Migration
  def change
    create_table :<%= model_class.tableize %> do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      
      t.timestamps
    end

    add_index :<%= model_class.tableize %>, :email, unique: true
  end
end
