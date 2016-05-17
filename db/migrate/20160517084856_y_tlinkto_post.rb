class YTlinktoPost < ActiveRecord::Migration
  def change
    add_column :posts, :ytlink, :string
  end
end
