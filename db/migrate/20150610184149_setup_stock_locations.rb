class SetupStockLocations < ActiveRecord::Migration
  def up
    Spree::StockLocation.update_all(active:false)
    Spree::StockLocation.create(is_default: true, name: "Stock Summary")
  end
end
