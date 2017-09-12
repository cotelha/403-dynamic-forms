class ProductField < ActiveRecord::Base
  belongs_to :product_type
  scope :requireds, -> { where(required: true) }
end
