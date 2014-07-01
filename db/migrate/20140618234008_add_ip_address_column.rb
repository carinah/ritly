class AddIpAddressColumn < ActiveRecord::Migration
  def change
    add_column :visits, :ip_address, :string, default: 0
  end
end
