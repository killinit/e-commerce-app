class Lesson
  include MongoMapper::Document
  belongs_to :order
  key :active, Boolean
end