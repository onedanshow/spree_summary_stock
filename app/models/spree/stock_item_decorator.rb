Spree::StockItem.class_eval do

  after_save :summarize_stock, if: :changed?

  private

    def summarize_stock
      # DD: ignore stock_location of current stock item to prevent infinite loop
      virtual_warehouse = Spree::StockLocation.summational.where.not(id:stock_location.try(:id)).first 

      if self.variant && virtual_warehouse
        real_warehouses = Spree::StockLocation.not_summational.where.not(id:virtual_warehouse.try(:id))
        sum = real_warehouses.inject(0) {|sum,w| sum + w.count_on_hand(variant) }
        virtual_warehouse.set_up_stock_item(self.variant).set_count_on_hand(sum)
      end
    end

end
