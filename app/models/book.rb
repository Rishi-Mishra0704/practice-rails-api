class Book < ApplicationRecord
    validates :name, presence: true
    validates :author_id, presence: true
  belongs_to :author
end
