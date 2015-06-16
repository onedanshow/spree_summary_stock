Deface::Override.new(
  :virtual_path => "spree/admin/stock_locations/index",
  :name => "admin_stock_location_instructions",
  :insert_before => "table#listing_stock_locations",
  :partial => "spree/admin/stock_locations/instructions",
  :disabled => false)