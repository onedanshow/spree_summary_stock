require 'spec_helper'

describe Spree::StockItem do

  let(:summary_stock) { create(:stock_location) }
  let(:stock_location_1) { create(:stock_location) }
  let(:stock_location_2) { create(:stock_location) }
  subject(:stock_item) { stock_location_1.stock_items.order(:id).first }

  # DD: product will create stock_items for itself at each stock location
  before { create(:product) }

  context 'when stock location is setup' do
    it { expect(summary_stock.stock_items.count).to be(1) }
    it { expect(stock_location_1.stock_items.count).to be(1) }
    it { expect(stock_location_2.stock_items.count).to be(1) }
  end

  describe '.summarize_stock' do
    it 'is not called on create' do
      expect(subject).not_to receive(:summarize_stock)
    end

    it 'is called on set_count_on_hand' do
      expect(subject).to receive(:summarize_stock)
      subject.set_count_on_hand(10)
    end

    
  end

end
