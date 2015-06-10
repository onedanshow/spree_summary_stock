Spree::StockItem.class_eval do

  after_save :summarize_stock, if: :changed?

  private

    def summarize_stock
      
    end

end
