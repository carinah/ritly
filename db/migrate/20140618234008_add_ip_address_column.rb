class AddIpAddressColumn < ActiveRecord::Migration
  def change
    add_column :visits, :ip_address, :integer, default: 0
  end
end
