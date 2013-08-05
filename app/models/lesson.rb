class Lesson
  include MongoMapper::EmbeddedDocument

  key :status, Integer
end