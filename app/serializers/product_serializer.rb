class ProductSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :product_categories
end
