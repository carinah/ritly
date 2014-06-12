class AddMyString < ActiveRecord::Migration
  def change
    add_column :urls, :my_string, :string, default: nil
  end
end
