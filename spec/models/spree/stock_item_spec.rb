require 'spec_helper'

describe Spree::StockItem do

  let(:stock_location_1) { create(:stock_location, default: false, active: false) }
  let(:stock_location_2) { create(:stock_location, default: false, active: false) }
  let(:summary_stock) { create(:stock_location, default: true, active: true) }

  # DD: product will create stock_items for itself at each stock location
  before { create(:product) }

  subject(:stock_item) { stock_location_1.stock_items.order(:id).first }
  let(:summary_stock_item) { summary_stock.stock_items.order(:id).first }

  context 'when stock location is setup' do
    it { expect(summary_stock.stock_items.count).to be(1) }
    it { expect(stock_location_1.stock_items.count).to be(1) }
    it { expect(stock_location_2.stock_items.count).to be(1) }
    
    context 'and using scopes' do
      before { stock_location_1; stock_location_2; summary_stock }
      it { expect(summary_stock.id).to be(Spree::StockLocation.summational.first.id) }
      it { expect(Spree::StockLocation.not_summational.count).to be(2) }
    end
  end

  describe '.summarize_stock' do
    it 'is not called on create' do
      expect(subject).not_to receive(:summarize_stock)
    end

    it 'is called on set_count_on_hand' do
      expect(subject).to receive(:summarize_stock)
      subject.set_count_on_hand(10)
    end

    it 'is called on adjust_count_on_hand' do
      expect(subject).to receive(:summarize_stock)
      subject.adjust_count_on_hand(10)
    end

    it 'sets stock item count_on_hand for summary stock warehouse' do
      expect(summary_stock_item.count_on_hand).to be(0)
      subject.set_count_on_hand(15)
      expect(summary_stock_item.reload.count_on_hand).to be(15)
    end

  end

end
