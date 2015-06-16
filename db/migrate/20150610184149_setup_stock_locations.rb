class SetupStockLocations < ActiveRecord::Migration
  def up
    Spree::StockLocation.update_all(active:false)
    Spree::StockLocation.create!(default: true, active:true, name: "Stock Summary")
  end
end
