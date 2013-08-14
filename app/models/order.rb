class Order
  include Mongoid::Document
  belongs_to :user
  has_many :lessons

  field :price, type: Integer
  field :quantity, type: Integer
end