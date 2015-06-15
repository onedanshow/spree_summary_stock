Spree::StockLocation.class_eval do

  scope :summational, -> { active.where(default:true) }
  scope :not_summational, -> { where.not(default:true, active:true) }

end
