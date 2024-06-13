class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 10}
end
