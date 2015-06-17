class SetupStockLocations < ActiveRecord::Migration
  def up
    # make the non-summational stock locations
    Spree::StockLocation.update_all(active:false)
    # make the summational stock location
    sl = Spree::StockLocation.create!(default: true, active:true, name: "Stock Summary")
    # update stock levels for summational stock location
    Spree::StockLocation.not_summational.first.stock_items.each{|si| si.send(:summarize_stock) }
    # move all pending shipments to use the new stock location
    Spree::Shipment.pending.update_all( stock_location_id:sl.id )
    Spree::Shipment.ready.update_all( stock_location_id:sl.id )
  end
end
