class Product < ActiveRecord::Base
  belongs_to :product_type
  has_many :product_properties
  accepts_nested_attributes_for :product_properties

  validates :name, presence: true
end
