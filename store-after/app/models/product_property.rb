class ProductProperty < ActiveRecord::Base
  attr_accessor :label_name, :field_type

  belongs_to :product_field
  belongs_to :product

  def label_name
    product_field.name
  end

  def field_type
    product_field.field_type
  end

  validate :validate_properties

  def validate_properties
    errors.add(label_name, "is not be blank") if data.blank? && product_field.required
  end
end
