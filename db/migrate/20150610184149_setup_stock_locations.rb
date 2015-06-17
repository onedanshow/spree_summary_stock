class SetupStockLocations < ActiveRecord::Migration
  def up
    # make the non-summational stock locations
    Spree::StockLocation.update_all(active:false)
    # make the summational stock location
    Spree::StockLocation.create!(default: true, active:true, name: "Stock Summary")
    # update stock levels for summational stock location
    Spree::StockLocation.not_summational.first.stock_items.each{|si| si.send(:summarize_stock) }
  end
end
