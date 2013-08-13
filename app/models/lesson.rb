class Lesson
  include Mongoid::Document
  belongs_to :order
  field :status, type: String
end